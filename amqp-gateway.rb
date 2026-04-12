class AmqpGateway < Formula
  desc 'Publish messages to AMQP broker (RabbitMQ) via HTTP.'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/amqp-gateway'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.0/amqp-gateway_v0.1.0_darwin_arm64.tar.gz'
      sha256 'ad9e070f409180ec98f7259f5baeebe85efaa147647056bc6476c453f3355de0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.0/amqp-gateway_v0.1.0_darwin_amd64.tar.gz'
      sha256 'abd85ccdf9a33d8c122521925d8570a040122e3fefe737ec58d3b5b50268400e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.0/amqp-gateway_v0.1.0_linux_arm64.tar.gz'
      sha256 '7bc7c86a91828f92a9a89df6f1dbe386abcf6929826bc6f2a81217ed54b55671'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/amqp-gateway/releases/download/v0.1.0/amqp-gateway_v0.1.0_linux_amd64.tar.gz'
      sha256 '1e5ce98a00a0561a10612b9e35fa085f1236c72bc9fe3f0665c63d6693660f6f'
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
