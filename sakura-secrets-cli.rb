class SakuraSecretsCli < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.1/sakura-secrets-cli_v0.3.1_darwin_arm64.tar.gz'
      sha256 'cff90787240e739f5c337c08b86eef3ae947921aeeddb26755bbdd2e07467646'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.1/sakura-secrets-cli_v0.3.1_darwin_amd64.tar.gz'
      sha256 '507b5decc4a1f45c4c460c22ed40b6b55fe3b04195d7faf28be1afa1eac48fe8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.1/sakura-secrets-cli_v0.3.1_linux_arm64.tar.gz'
      sha256 '8ed10dbadab81c7dc50ee6898b3ac4c4df807f9600fd06bc7170a43df4001e49'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.1/sakura-secrets-cli_v0.3.1_linux_amd64.tar.gz'
      sha256 '13d90ed632db79ab84cbb9070673b0ddfb395a85a3fa53d919f8a8f0d941e77a'
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
