class SimplemqCli < Formula
  version '0.7.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-cli_0.7.0_darwin_arm64.tar.gz'
      sha256 'c0707e42104445eca38fd946d4e99a6133fc066a3f765ede91257057327bd609'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-cli_0.7.0_darwin_amd64.tar.gz'
      sha256 '198137f74e5ad132f6b8b2d2e322337fcbac5deb5894a132e0de3f31073cd2db'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-cli_0.7.0_linux_arm64.tar.gz'
      sha256 '61b51d2c37734ebec8feb2cb02b05759102e457e8ed58415ecd952ed8efeb77a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-cli_0.7.0_linux_amd64.tar.gz'
      sha256 'bf696e6f716c4ecd96f8a4f04e64d1ac64b770303b34dbe8ae1e89572948f4ca'
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
