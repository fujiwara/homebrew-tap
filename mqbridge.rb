class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.2.0'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.0/mqbridge_v0.2.0_darwin_arm64.tar.gz'
      sha256 'd68bfe3e0b1f24df7c242ce480715a29094ac3ae2163a3147156b848ec976b30'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.0/mqbridge_v0.2.0_darwin_amd64.tar.gz'
      sha256 'ec7bddbcc3417ecde21912707f14fa71cc3625b3a355ac69402ca7f25d7d4633'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.0/mqbridge_v0.2.0_linux_arm64.tar.gz'
      sha256 '702cc927ee34e7246ebc9c5c660649c19e98146de80095e85449981f487f6d2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.0/mqbridge_v0.2.0_linux_amd64.tar.gz'
      sha256 '34cf1ec0a9e7ebe7766882b0d260a49a8ee526a4714cfd3583b9604bf9c6b76f'
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
