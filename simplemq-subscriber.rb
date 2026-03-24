class SimplemqSubscriber < Formula
  desc 'simplemq-subscriber is a subscriber for Sakura SimpleMQ'
  version '0.2.2'
  homepage 'https://github.com/fujiwara/simplemq-subscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.2/simplemq-subscriber_v0.2.2_darwin_arm64.tar.gz'
      sha256 '1e2610907ba939f052f1b09af907e98cc3a84b0c30b60119a1bcab8a98e6b167'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.2/simplemq-subscriber_v0.2.2_darwin_amd64.tar.gz'
      sha256 '07b9559e976188d544f37557907bd6c41d8edac33e424d1ab01c473cc1e56935'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.2/simplemq-subscriber_v0.2.2_linux_arm64.tar.gz'
      sha256 'bc0bbe03ef5e930a668278906354b75737ed53387963cf93335a3bbfa27e9978'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-subscriber/releases/download/v0.2.2/simplemq-subscriber_v0.2.2_linux_amd64.tar.gz'
      sha256 '894a9d9d53e97f1b7701e2650084f72500ec32e361a99a8869696b66bf6db711'
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
