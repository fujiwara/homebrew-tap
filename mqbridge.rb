class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.2.1'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.1/mqbridge_v0.2.1_darwin_arm64.tar.gz'
      sha256 '7cfea39cc2d81c81d387d2352d39ac6b758b4a3ac1b6ab5aa75bf43eb15d90a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.1/mqbridge_v0.2.1_darwin_amd64.tar.gz'
      sha256 '5508e1eae304e184523b08637c448aedbf32d58843e54691862514999556c587'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.1/mqbridge_v0.2.1_linux_arm64.tar.gz'
      sha256 'e8ac08c3c563b46cdf2a8229466011d63961b40f5dea60b0ee93eebb00ecb60f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.2.1/mqbridge_v0.2.1_linux_amd64.tar.gz'
      sha256 '8661ecf3a004289219393a254e883e1a58bd916a2809cbabb1ddd901dfa8b072'
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
