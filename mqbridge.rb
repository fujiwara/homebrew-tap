class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.4.1'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.1/mqbridge_v0.4.1_darwin_arm64.tar.gz'
      sha256 'bd979740f7bd499238f192bc9c615241dc26af2a8ac2de2cfe7aaff06fb396bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.1/mqbridge_v0.4.1_darwin_amd64.tar.gz'
      sha256 '5aa8a991605cfab1e32b317b5e5cd0d2b0552e7b07f4903e4a73b9502e59d3a5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.1/mqbridge_v0.4.1_linux_arm64.tar.gz'
      sha256 '32ae7de7e3ab27fb4222b42baa793a32d6ebdfd9114a0473d5b9d7ec67c6bb82'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.1/mqbridge_v0.4.1_linux_amd64.tar.gz'
      sha256 'f5add63b4e042a8fbe5cb30d7c45ffe86f99ff42b6f7777651a8fd75c0d003ba'
    end
  end

  head do
    url 'https://github.com/fujiwara/mqbridge.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mqbridge'
  end
end
