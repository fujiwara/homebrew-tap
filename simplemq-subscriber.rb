class SimplemqSubscriber < Formula
  desc 'simplemq-subscriber is a subscriber for Sakura SimpleMQ'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/simplemq-subscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.1.0/simplemq-subscriber_v0.1.0_darwin_arm64.tar.gz'
      sha256 'c1b6761b366e209a4995813caffe00b6aa8a9edee2f8f360ead5d1a9d7e2e2ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.1.0/simplemq-subscriber_v0.1.0_darwin_amd64.tar.gz'
      sha256 '6c3a76de6e6452c12f493d5774dac47f81160af7815ae70a6afb5ced49acee28'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.1.0/simplemq-subscriber_v0.1.0_linux_arm64.tar.gz'
      sha256 '67417560cde32ee9cafd4bdde09c8e1acf3eccb401b5923b04bffa8de4dee2a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.1.0/simplemq-subscriber_v0.1.0_linux_amd64.tar.gz'
      sha256 '78b8b5362e5b9aa5a7495e9afdd24dbc98b224728862fdcdfb200c68c36a451d'
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
