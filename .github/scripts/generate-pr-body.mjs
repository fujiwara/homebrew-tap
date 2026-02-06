import { CopilotClient } from "@github/copilot-sdk";

async function readStdin() {
  const chunks = [];
  for await (const chunk of process.stdin) {
    chunks.push(chunk);
  }
  return Buffer.concat(chunks).toString("utf-8");
}

function parseDiffFallback(diff) {
  const updates = [];
  let currentFile = null;
  let oldVersion = null;
  let newVersion = null;

  for (const line of diff.split("\n")) {
    const fileMatch = line.match(/^diff --git a\/(.+\.rb) b\//);
    if (fileMatch) {
      if (currentFile && oldVersion && newVersion) {
        updates.push({ file: currentFile, from: oldVersion, to: newVersion });
      }
      currentFile = fileMatch[1].replace(".rb", "");
      oldVersion = null;
      newVersion = null;
    }
    const oldVersionMatch = line.match(/^-\s+version\s+'([^']+)'/);
    if (oldVersionMatch) oldVersion = oldVersionMatch[1];
    const newVersionMatch = line.match(/^\+\s+version\s+'([^']+)'/);
    if (newVersionMatch) newVersion = newVersionMatch[1];
  }
  if (currentFile && oldVersion && newVersion) {
    updates.push({ file: currentFile, from: oldVersion, to: newVersion });
  }

  if (updates.length === 0) return "";

  let body = "## Updated Formulae\n\n";
  body += "| Formula | Previous Version | New Version |\n";
  body += "|---------|-----------------|-------------|\n";
  for (const u of updates) {
    body += `| ${u.file} | ${u.from} | ${u.to} |\n`;
  }
  return body;
}

async function generateWithCopilot(diff) {
  const token = process.env.COPILOT_TOKEN;
  const clientOptions = token ? { githubToken: token } : {};
  const client = new CopilotClient(clientOptions);
  try {
    const session = await client.createSession({
      model: "gpt-5.1-mini",
      systemMessage: {
        mode: "append",
        content:
          "You are a helpful assistant that generates concise pull request descriptions " +
          "for a Homebrew tap repository. The user will provide a git diff of .rb formula files. " +
          "Summarize which tools were updated and to what versions. " +
          "Output ONLY the PR body in GitHub-flavored Markdown, nothing else.",
      },
    });

    const prompt =
      "Generate a pull request description for the following Homebrew formula update diff. " +
      "List each updated formula with its previous and new version in a markdown table. " +
      "Include links to the release page based on the homepage URL in the formula. " +
      "Keep it concise.\n\n```diff\n" +
      diff +
      "\n```";

    const response = await session.sendAndWait({ prompt });

    if (response?.data?.content) {
      return response.data.content;
    }
    throw new Error("Empty response from Copilot SDK");
  } finally {
    await client.stop();
  }
}

async function main() {
  const diff = await readStdin();
  if (!diff.trim()) {
    process.exit(0);
  }

  const useCopilot = process.env.USE_COPILOT_SDK === "true";
  if (useCopilot) {
    try {
      const body = await generateWithCopilot(diff);
      process.stdout.write(body);
      return;
    } catch (err) {
      console.error(`Copilot SDK failed, using fallback: ${err.message}`);
    }
  }
  process.stdout.write(parseDiffFallback(diff));
}

main().catch((err) => {
  console.error(err.message);
  process.exit(1);
});
