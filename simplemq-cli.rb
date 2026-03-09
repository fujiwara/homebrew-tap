class SimplemqCli < Formula
  version '0.7.1'
  homepage 'https://github.com/fujiwara/simplemq-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.1/simplemq-cli_0.7.1_darwin_arm64.tar.gz'
      sha256 '1c6caec58636a0f435756c2918ab27895798dc3af9f7d2d90710e6c76577562c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.1/simplemq-cli_0.7.1_darwin_amd64.tar.gz'
      sha256 '2853e6d32d67273ed0dca7a9958b1a19675eb4dddd949c4a37abafd8bf596f3d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.1/simplemq-cli_0.7.1_linux_arm64.tar.gz'
      sha256 'd2c1039f9f0174c25da65068f7036db1e10bdc371dee266e6c9ffbc3a7f51d86'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.1/simplemq-cli_0.7.1_linux_amd64.tar.gz'
      sha256 'dfe4e76e0639400711cd31542e60e956babf8a7af01654aa26c0445216940080'
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
