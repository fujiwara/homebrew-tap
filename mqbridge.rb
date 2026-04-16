class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.4.3'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.3/mqbridge_v0.4.3_darwin_arm64.tar.gz'
      sha256 'fd178e602312b769eaa543c2233588b939259b9327062eec2166e1e9721379ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.3/mqbridge_v0.4.3_darwin_amd64.tar.gz'
      sha256 '2e1f5de479899f59b839ca5e761d65fe95f3adac3d6a34cde5f4a3e4b8c83b73'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.3/mqbridge_v0.4.3_linux_arm64.tar.gz'
      sha256 'af64ab106690323e62e5b2525fb9ca1cb21b776d89f14682166d47a553fc7fa5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.3/mqbridge_v0.4.3_linux_amd64.tar.gz'
      sha256 '4de76a602c28abd25040b6745ae9f556da05bb9f857512e92411acc8070b0cce'
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
