class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.0.2'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.2/mqbridge_v0.0.2_darwin_arm64.tar.gz'
      sha256 'b082c5d6bfbaad908535c4b82dfbef17925862d64ba887fe91493ab715f79d43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.2/mqbridge_v0.0.2_darwin_amd64.tar.gz'
      sha256 'ca7f8a0b34be57f8e500fffd81af4fffa84822687780af4e86323ae974913a3e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.2/mqbridge_v0.0.2_linux_arm64.tar.gz'
      sha256 '5e2bfe1134d8c9925fc2d0a79aab9bfd8f18f5c8779691878ebb3a324a46a44f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.2/mqbridge_v0.0.2_linux_amd64.tar.gz'
      sha256 '6b56bda68ae1d8ba07c1d9d07b2df8c6a262ebd1eeb0d03351ded4d050018768'
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
