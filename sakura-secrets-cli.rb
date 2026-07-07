class SakuraSecretsCli < Formula
  version '0.3.2'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.2/sakura-secrets-cli_v0.3.2_darwin_arm64.tar.gz'
      sha256 'e5b3b61f66e5d6fe2104310b3518b8911edc0f1df8d24980af70fd6b584bf4a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.2/sakura-secrets-cli_v0.3.2_darwin_amd64.tar.gz'
      sha256 '8083c161e796ee16447b784d65b45e8aea8461176ba6f581ed04cd8b4ecd9448'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.2/sakura-secrets-cli_v0.3.2_linux_arm64.tar.gz'
      sha256 '9629d3d4da3c1ea29ff1f458d55c8592adf1da10d8234719654bb603908a0908'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.2/sakura-secrets-cli_v0.3.2_linux_amd64.tar.gz'
      sha256 'e89d222092e27bf7538581747c8c056a05203fd7de532fc10abf8b75c06df3ee'
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
