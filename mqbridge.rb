class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.4.0'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.0/mqbridge_v0.4.0_darwin_arm64.tar.gz'
      sha256 'c25a565a67af926f34e34a011ec00df7bb4603aaa9e0b782b5ae7d54f259f60e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.0/mqbridge_v0.4.0_darwin_amd64.tar.gz'
      sha256 '709e8228ccf878430a1921183c8ddaa6cfe968bbed9ff56abaed71a60e46ad1d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.0/mqbridge_v0.4.0_linux_arm64.tar.gz'
      sha256 'ff4a070c776832c96067385f60cae9b55aa68065f506c12e8bb67f60c93665f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.4.0/mqbridge_v0.4.0_linux_amd64.tar.gz'
      sha256 'd4760f887e643f4292d620ef9572d3f27c747d3e29198cc80790cedba8a07d3a'
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
