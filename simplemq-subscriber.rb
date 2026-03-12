class SimplemqSubscriber < Formula
  desc 'simplemq-subscriber is a subscriber for Sakura SimpleMQ'
  version '0.0.2'
  homepage 'https://github.com/fujiwara/simplemq-subscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.2/simplemq-subscriber_v0.0.2_darwin_arm64.tar.gz'
      sha256 'f0d5102949afc2263b57aa7900e4a16cce363ad0da0bdfb6d6e5af9264c7645b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.2/simplemq-subscriber_v0.0.2_darwin_amd64.tar.gz'
      sha256 '76d8cd32787fd9f38934ecc9b82e2dd225337254779aa24a65b8e3a85fdf133c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.2/simplemq-subscriber_v0.0.2_linux_arm64.tar.gz'
      sha256 'ce036129674d55ce5978f22aca4cf43b5d696c3cf172e11a16ded324b6949431'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.0.2/simplemq-subscriber_v0.0.2_linux_amd64.tar.gz'
      sha256 '4aea104506d5b8d1b938d4b1d0ebea88d932655de55642245f4cae8634740053'
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
