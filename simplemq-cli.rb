class SimplemqCli < Formula
  version '0.8.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.8.0/simplemq-cli_0.8.0_darwin_arm64.tar.gz'
      sha256 '6df8413acc4c1837b824031f09bc8e5e12030d2efa27a736168f6cff162ccf53'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.8.0/simplemq-cli_0.8.0_darwin_amd64.tar.gz'
      sha256 'b1caeb62875835fcd1bf035a6fd822dc6d017f27d71cfb68f582c6fdea3241ec'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.8.0/simplemq-cli_0.8.0_linux_arm64.tar.gz'
      sha256 '8318de684a5398c87c6ae073bac88fa3eaa36044f6c8d81ff2a34f719e5d2385'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.8.0/simplemq-cli_0.8.0_linux_amd64.tar.gz'
      sha256 'de230eb34e5731de4b00f3dadb711471dc02271018fa9b0d2bbcd9c4e098796e'
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
