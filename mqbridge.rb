class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.3.0'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.0/mqbridge_v0.3.0_darwin_arm64.tar.gz'
      sha256 '05d8726bd11ad95ec429994d9974737c64b3d9665302a1bb41775e1a949e75b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.0/mqbridge_v0.3.0_darwin_amd64.tar.gz'
      sha256 '88da6745fb998710ddb33a2d14118acedb509420a96c5d55c56e51987eaeda5a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.0/mqbridge_v0.3.0_linux_arm64.tar.gz'
      sha256 '13184ccb3af36e611e51cd5f4d5c0b433ac4bcced5a9477fc97c01d539ff0f92'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.0/mqbridge_v0.3.0_linux_amd64.tar.gz'
      sha256 '29dc27dc83f705061d91e7213f110de650357a74ad3bd6559f9de6bd517667b1'
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
