class SakuraSecretsCli < Formula
  version '0.3.4'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.4/sakura-secrets-cli_v0.3.4_darwin_arm64.tar.gz'
      sha256 '33a414e6a512c53b4fb39723ce6cb3ca915c2279317c7b9714a316d3c4f1a1a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.4/sakura-secrets-cli_v0.3.4_darwin_amd64.tar.gz'
      sha256 'a3c6eb8f16f92cc40567fc6f2039fc31d393717cec59ff6dc83999d47b2524a8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.4/sakura-secrets-cli_v0.3.4_linux_arm64.tar.gz'
      sha256 '3258194f5944545339385c155b59d8a1196c7a47d391ac64ce43e592fceb5f4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.4/sakura-secrets-cli_v0.3.4_linux_amd64.tar.gz'
      sha256 '4fabafe5e97ae21f38c096fe805207bf65e6cba36f3943331881e2d25353d154'
    end
  end

  head do
    url 'https://github.com/fujiwara/sakura-secrets-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'sakura-secrets-cli'
  end
end
