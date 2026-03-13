class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.1.1'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.1/mqbridge_v0.1.1_darwin_arm64.tar.gz'
      sha256 '6f3bf79e470232a41d7e891a4475ce4a51ee4ae8eac842e5935711bb2ba7c9ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.1/mqbridge_v0.1.1_darwin_amd64.tar.gz'
      sha256 '43928441fac1080dda6a25a7c1c3f54cc0f1e3c72bb6b1e892797c0cb11137ed'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.1/mqbridge_v0.1.1_linux_arm64.tar.gz'
      sha256 '0824d9cf24962187c0d4cbb9b352c99dc306f835fafdc1e672043518fbf73683'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.1/mqbridge_v0.1.1_linux_amd64.tar.gz'
      sha256 '0baa52e3f9650ad08bd40aaadc12b27fd4a76671b0aef8397b59898a2db1aaf5'
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
