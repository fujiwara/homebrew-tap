class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.0.4'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.4/mqbridge_v0.0.4_darwin_arm64.tar.gz'
      sha256 '72f3563ca293b4954d2edb20c05ac59485f818f0cd21267557bf590868184f27'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.4/mqbridge_v0.0.4_darwin_amd64.tar.gz'
      sha256 '1eadf71aeb93aac876d8bdf084e6b6d529498b0e4af01e7e4a8a15b501eafff2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.4/mqbridge_v0.0.4_linux_arm64.tar.gz'
      sha256 'bc54728e6a55ba457dc95345351ea11e0a8f823856a708f2b595e0d910ba5654'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.4/mqbridge_v0.0.4_linux_amd64.tar.gz'
      sha256 '3692969002b295075ffb4ecefdc1b3949c319c89c9d5ccc2a109bb06abf4208f'
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
