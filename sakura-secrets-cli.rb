class SakuraSecretsCli < Formula
  version '0.2.0'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.2.0/sakura-secrets-cli_v0.2.0_darwin_arm64.tar.gz'
      sha256 '51a2360a57e2f7892eb93b7f21dc46fdaf0823e32ea9f38dc94897762ab07e2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.2.0/sakura-secrets-cli_v0.2.0_darwin_amd64.tar.gz'
      sha256 '11f3ad55a459e62bc965a08498855e327dd353b2bd5cbd2425a80449da667d80'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.2.0/sakura-secrets-cli_v0.2.0_linux_arm64.tar.gz'
      sha256 '1f9cf0d16f6bc9e3d269d3bcc4db2b35c8b1b1b71e173334b046633968667332'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.2.0/sakura-secrets-cli_v0.2.0_linux_amd64.tar.gz'
      sha256 '3f82cb81ab04e27f4ad8419345252e695a1a2546c1497b5577b3517cbd989330'
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
