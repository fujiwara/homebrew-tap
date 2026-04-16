class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.7.5'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.5/mqsubscriber_v0.7.5_darwin_arm64.tar.gz'
      sha256 '7989d716e9eec0677abeacec6579b48eef3c5c8f410e793cc6c61ce5f1a8d893'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.5/mqsubscriber_v0.7.5_darwin_amd64.tar.gz'
      sha256 'f183d669f439baf065b274d3b3b366d035a43458ce8816441fbec5d245d45af9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.5/mqsubscriber_v0.7.5_linux_arm64.tar.gz'
      sha256 '982a636d966bffd98f84e4a8f00d645f4c093a6a38628b9a25c2389a07c8871b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.5/mqsubscriber_v0.7.5_linux_amd64.tar.gz'
      sha256 '3ad2449bfc935eda992c9ac94d09a1924089ff094111fb57276f80e4135b5d16'
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
