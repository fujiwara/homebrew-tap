class SimplemqCli < Formula
  version '0.9.3'
  homepage 'https://github.com/fujiwara/simplemq-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.3/simplemq-cli_0.9.3_darwin_arm64.tar.gz'
      sha256 '07ddacbaf2739b137879975e45fdf8cff6514c79755cdd570eecd3fc6529a468'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.3/simplemq-cli_0.9.3_darwin_amd64.tar.gz'
      sha256 '349d0fe6c87f288746b797de9c8dfe14bfcce958d75eeb40e7d12d39d8eaa444'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.3/simplemq-cli_0.9.3_linux_arm64.tar.gz'
      sha256 'fb78a92c42096a6b7748d619527114cd29169bae0b6c9a6c4be42807cff3f2f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.3/simplemq-cli_0.9.3_linux_amd64.tar.gz'
      sha256 'fe676ae8f141855df3a2b24018273eb9b76e1e45d4e3543620eebee7d9dcd5de'
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

  test do
    system "#{bin}/simplemq-cli", '-h'
  end
end
