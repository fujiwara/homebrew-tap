class AmqpGateway < Formula
  desc 'Publish messages to AMQP broker (RabbitMQ) via HTTP.'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/amqp-gateway'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.3/amqp-gateway_v0.0.3_darwin_arm64.tar.gz'
      sha256 '614325c13fdfeca2200da06574ed4d9846f953c2082c16e3c90bbcd787184b7b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.3/amqp-gateway_v0.0.3_darwin_amd64.tar.gz'
      sha256 'b6e81ba132b75c50b415fc24db9c8c5e29b38ed891efddda5eb161607087c60a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.3/amqp-gateway_v0.0.3_linux_arm64.tar.gz'
      sha256 'd01b4f4bffe395fe01a01a24326c9e7f90fe6507217b7297cd5c3fe6e5e2e60b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.0.3/amqp-gateway_v0.0.3_linux_amd64.tar.gz'
      sha256 'f9489e07bd724c2a7c901bb6713b7c2b1f8394e550cbb3e09cfc87469f4085f2'
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
