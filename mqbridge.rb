class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.0/mqbridge_v0.1.0_darwin_arm64.tar.gz'
      sha256 '993e6df4cd33052735fca39fe2b0c37c648eed7537405533fe3b05eb819a8eb2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.0/mqbridge_v0.1.0_darwin_amd64.tar.gz'
      sha256 '54fbe398ca3b6cdb5c3e0ede0e44a33538b62baef0fe8f2c5bf3d2ad03c00120'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.0/mqbridge_v0.1.0_linux_arm64.tar.gz'
      sha256 '80572a69c1db729c7446c9d153001efea4ac4ced9b7d8be316d865aed1547f70'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.1.0/mqbridge_v0.1.0_linux_amd64.tar.gz'
      sha256 '50a4b7389bb76b4a06ef94054bba4b63e75c3b44c0cb8209041ef7a18d650f13'
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
