class AmqpGateway < Formula
  desc 'Publish messages to AMQP broker (RabbitMQ) via HTTP.'
  version '0.1.2'
  homepage 'https://github.com/fujiwara/amqp-gateway'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.2/amqp-gateway_v0.1.2_darwin_arm64.tar.gz'
      sha256 '480567085d5cb92d68a8dd8d9e88e288d4d01ffb7581e3abdba4a959c3854fdb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.2/amqp-gateway_v0.1.2_darwin_amd64.tar.gz'
      sha256 'bc885a108ecb4c7aa3affc01bccf253d0e4d6b66de69598d4fea35f6d4e824c7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.2/amqp-gateway_v0.1.2_linux_arm64.tar.gz'
      sha256 '49f68a850495daebf2f60d37897e57b5d0187c91a821466eb0e559cf16484348'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.2/amqp-gateway_v0.1.2_linux_amd64.tar.gz'
      sha256 '284d45ea22a056196f6801e32d4f3599de96fd1c70f06b48f802ac8ecdedc1e6'
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
