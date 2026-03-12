class SimplemqSubscriber < Formula
  desc 'simplemq-subscriber is a subscriber for Sakura SimpleMQ'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/simplemq-subscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.3/simplemq-subscriber_v0.0.3_darwin_arm64.tar.gz'
      sha256 'cb85d5d1678eeb604b69fd5a71c30174c02d8b2dec0fe5f18c8c5e39a978972b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.3/simplemq-subscriber_v0.0.3_darwin_amd64.tar.gz'
      sha256 '028c19c973cf2b617ed3f5e9266625d1c1860f0dce353e13e2f965ecb6f0aea5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.3/simplemq-subscriber_v0.0.3_linux_arm64.tar.gz'
      sha256 'ffcdbe20482c12b655ce72476afc5576c7a9d32c4a71ebcd5695957b68cc7ec3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.3/simplemq-subscriber_v0.0.3_linux_amd64.tar.gz'
      sha256 'bdf81b8e630d68625027db0bba3d4582742625612636d1748ae2e2779a5dee48'
    end
  end

  head do
    url 'https://github.com/fujiwara/simplemq-subscriber.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'simplemq-subscriber'
  end

  test do
    system "#{bin}/simplemq-subscriber", '-h'
  end
end
