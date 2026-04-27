class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.7.6'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.6/mqsubscriber_v0.7.6_darwin_arm64.tar.gz'
      sha256 'fe99bd7572181b0585d74bdaf7d18234de4b578007b3ee7cd3a35e955ab45784'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.6/mqsubscriber_v0.7.6_darwin_amd64.tar.gz'
      sha256 'b1f0943dfa493e9840e48c0b334766942d13515f6ab5a7b43f3f4864a39d5fdf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.6/mqsubscriber_v0.7.6_linux_arm64.tar.gz'
      sha256 '9a88626e40c0d8894e0e6159b06d0e517ba018ec8a5937bc4ecb52e046064a7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.6/mqsubscriber_v0.7.6_linux_amd64.tar.gz'
      sha256 '180e78016a14c0b96b8248751bc5149cce78d918689ba935e70038f153b57623'
    end
  end

  head do
    url 'https://github.com/fujiwara/mqsubscriber.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mqsubscriber'
  end

  test do
    system "#{bin}/mqsubscriber", '-h'
  end
end
