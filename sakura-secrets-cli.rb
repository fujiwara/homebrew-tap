class SakuraSecretsCli < Formula
  version '0.3.3'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.3/sakura-secrets-cli_v0.3.3_darwin_arm64.tar.gz'
      sha256 'bb22d9addcdd09c244341767e58d642838f894cb75a199a872a6c196c485fef9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.3/sakura-secrets-cli_v0.3.3_darwin_amd64.tar.gz'
      sha256 '8643500f59c7c371c36c3530f4f804e6caf84c77f8bc06d921bc55435b7f9779'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.3/sakura-secrets-cli_v0.3.3_linux_arm64.tar.gz'
      sha256 '609dde01cf305e13997f103d2c95b862e123368c38fa6d6aa130d38a36979662'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.3/sakura-secrets-cli_v0.3.3_linux_amd64.tar.gz'
      sha256 '35acbb7b332e98140b5a0a983c06c106a68c4d3f15ad23f01849a41c2b17ef44'
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
