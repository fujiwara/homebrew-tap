class AmqpGateway < Formula
  desc 'Publish messages to AMQP broker (RabbitMQ) via HTTP.'
  version '0.0.2'
  homepage 'https://github.com/fujiwara/amqp-gateway'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.2/amqp-gateway_v0.0.2_darwin_arm64.tar.gz'
      sha256 'b3555c3e2aa3b12948d2dd116510e110a954a9016ac23cc0d6e2fe1b918da79a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.2/amqp-gateway_v0.0.2_darwin_amd64.tar.gz'
      sha256 'e9a40a9359794f04c994f48d0383090a0633dcdf298f6a0ca7dfc760e2dffb99'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.2/amqp-gateway_v0.0.2_linux_arm64.tar.gz'
      sha256 'bd343f7f2cfa569ff3da0ebaf22c681076fdb1ad5757bc21e791d8428d8dfae3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.2/amqp-gateway_v0.0.2_linux_amd64.tar.gz'
      sha256 '57b74378eeddba3260b49ef52a986a5d381d459a20e0ccb4b05cb69e12b64876'
    end
  end

  head do
    url 'https://github.com/fujiwara/amqp-gateway.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'amqp-gateway'
  end

  test do
    system "#{bin}/amqp-gateway", '-h'
  end
end
