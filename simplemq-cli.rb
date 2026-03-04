class SimplemqCli < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.4.0/simplemq-cli_v0.4.0_darwin_arm64.tar.gz'
      sha256 'bde29fa36b86d867e6b53c42474618c5e2f9b40ee62fc9d2e75308257b0eba33'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.4.0/simplemq-cli_v0.4.0_darwin_amd64.tar.gz'
      sha256 '8fee7617c59092bd9b55d8312d5a90747d85a8ef8ae420407ecf29b6fe7897ce'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.4.0/simplemq-cli_v0.4.0_linux_arm64.tar.gz'
      sha256 '4943b75d00a662b37aa6c30881409f0e550c8f700f216acf4f783564caa795a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.4.0/simplemq-cli_v0.4.0_linux_amd64.tar.gz'
      sha256 'a50823653f3a6c699a51148003f45c81d53e420cd8468f1bfdf8e91a263c86bb'
    end
  end

  head do
    url 'https://github.com/fujiwara/simplemq-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'simplemq-cli'
  end
end
