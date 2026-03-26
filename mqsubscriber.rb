class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.4.1'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.4.1/mqsubscriber_v0.4.1_darwin_arm64.tar.gz'
      sha256 'acab730562fb5762ec568fd476f4a5d51df406ab1d65861c05e1ae40e43d9c80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.4.1/mqsubscriber_v0.4.1_darwin_amd64.tar.gz'
      sha256 'e1b86f68e622beca24d4db6356680075302cbcb444a8ebf2f861192a6af0ffe1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.4.1/mqsubscriber_v0.4.1_linux_arm64.tar.gz'
      sha256 'c82b6e62fb0b181f5b4ec44fea28c05d35cf1d7f09a5e2a3997d4d590fe02afd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.4.1/mqsubscriber_v0.4.1_linux_amd64.tar.gz'
      sha256 'b76772765b75c446e7db4d506abd4ac1bf0bd731b72e53e04c228bf61033cfb5'
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
