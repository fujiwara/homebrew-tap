class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.6.1'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.6.1/mqsubscriber_v0.6.1_darwin_arm64.tar.gz'
      sha256 '6ddb63156c5ea2b36aedb40c257df685ed95e4a0472e8ec15f378044ad31c686'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.6.1/mqsubscriber_v0.6.1_darwin_amd64.tar.gz'
      sha256 'a555432667856ec035e42dd41e9e7e2bbb8fc486f7aa26f1550fd97106819218'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.6.1/mqsubscriber_v0.6.1_linux_arm64.tar.gz'
      sha256 'fc99861820ea1be785945adff72f2cd6731ddc5c18518556ad84aac971555c44'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.6.1/mqsubscriber_v0.6.1_linux_amd64.tar.gz'
      sha256 '33e29c45ce30943f0ec869467f22be4d6b2fc0b49c5f05fd3bbcf0b5fcf31a0b'
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
