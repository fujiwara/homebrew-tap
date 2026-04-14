class AmqpGateway < Formula
  desc 'Publish messages to AMQP broker (RabbitMQ) via HTTP.'
  version '0.1.1'
  homepage 'https://github.com/fujiwara/amqp-gateway'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.1/amqp-gateway_v0.1.1_darwin_arm64.tar.gz'
      sha256 '1555760bc179244cfcc809664a73e015850c55cb58f8f82f72aa5ab5db9ef5dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.1/amqp-gateway_v0.1.1_darwin_amd64.tar.gz'
      sha256 'dc1c372b94ca14fc29ce1fdafe643bf6d1c310d7a821ec688ce655e23f4191c3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.1/amqp-gateway_v0.1.1_linux_arm64.tar.gz'
      sha256 'b70b4031a31e1d44faa2c5f358a199bdf97bac1a6347301a306628468e21796b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.1/amqp-gateway_v0.1.1_linux_amd64.tar.gz'
      sha256 '2290185f5413a95b73d67894008fcca35e60f5f9110297b358623d41d8237a3e'
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
