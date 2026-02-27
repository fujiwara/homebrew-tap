class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.0.1'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.1/mqbridge_v0.0.1_darwin_arm64.tar.gz'
      sha256 '53562df76206c268a5a0b5ed5d1357d244bf820af0f78c8fe6213a682f64f8ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.1/mqbridge_v0.0.1_darwin_amd64.tar.gz'
      sha256 '6cf08540a6d86bbe8d8f72dac27320af6c427487dbdae3dbd9093211aed84eec'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.1/mqbridge_v0.0.1_linux_arm64.tar.gz'
      sha256 'cbcbcdb5aa390bffedbc9d53fb1ad5db2a323f5d7057254a2c97fa224416e178'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.1/mqbridge_v0.0.1_linux_amd64.tar.gz'
      sha256 'eedf658397e4d6c21e88ff142aacac115e937f0066f00ea4995c2d3601b33327'
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
