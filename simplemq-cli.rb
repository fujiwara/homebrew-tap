class SimplemqCli < Formula
  version '0.9.1'
  homepage 'https://github.com/fujiwara/simplemq-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.1/simplemq-cli_0.9.1_darwin_arm64.tar.gz'
      sha256 '3b8f52c27e7cc752d7ec75d08b0cfa750b667ea5cde20a900e9ef5939a289268'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.1/simplemq-cli_0.9.1_darwin_amd64.tar.gz'
      sha256 '3e89d7ad27fe8cf5a62759968ec82dcf6ea492864ebd1795bf98ca825205fad4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.1/simplemq-cli_0.9.1_linux_arm64.tar.gz'
      sha256 'c127ed6720c1ef7896cc52a3ea3cfd5c76b4b2091d614604c511124af8a0ce72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.1/simplemq-cli_0.9.1_linux_amd64.tar.gz'
      sha256 '0923677c1d454e253e476f197c8392fb32f4538f8f89261513e07da347b971c4'
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
