class SakuraSecretsCli < Formula
  version '0.1.2'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.1.2/sakura-secrets-cli_v0.1.2_darwin_arm64.tar.gz'
      sha256 '0a7c3c5a25e1ed1fde217335599fcf487c4747d00d62f7bb2b72c41e2b790d4d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.1.2/sakura-secrets-cli_v0.1.2_darwin_amd64.tar.gz'
      sha256 '5b2169905e8c57a2825e39e1701e716be7762a716b113a0c52124a2c366d21b8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.1.2/sakura-secrets-cli_v0.1.2_linux_arm64.tar.gz'
      sha256 'c1199e6338c1ddf096785113307598d1c4ff5f136fa40c8863f489f2ac0d2a75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.1.2/sakura-secrets-cli_v0.1.2_linux_amd64.tar.gz'
      sha256 '7a4556ea6ca4935b549c6dbe62ac2e2d48ebcd9b8d32bfe6ade38331b4365dff'
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
