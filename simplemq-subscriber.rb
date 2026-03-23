class SimplemqSubscriber < Formula
  desc 'simplemq-subscriber is a subscriber for Sakura SimpleMQ'
  version '0.2.0'
  homepage 'https://github.com/fujiwara/simplemq-subscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.0/simplemq-subscriber_v0.2.0_darwin_arm64.tar.gz'
      sha256 '7e1f61bc633a4108c05812b6b703f74731bebc8d7b642eabd7df0a951e549333'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.0/simplemq-subscriber_v0.2.0_darwin_amd64.tar.gz'
      sha256 'e88eeb409d596791a366f6f8709daa3437ab6e4a18e3cd25a1f68973d3488c98'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.0/simplemq-subscriber_v0.2.0_linux_arm64.tar.gz'
      sha256 'f957325d7bba09d527f0ed37c3211dea49761ad20693857c19c8b1553b3e8810'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.0/simplemq-subscriber_v0.2.0_linux_amd64.tar.gz'
      sha256 '2a5663b4d2402c945f20fc216f0edb200a5495c220d18e83f00fe9f695bfec12'
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
