class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.7.0'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.0/mqsubscriber_v0.7.0_darwin_arm64.tar.gz'
      sha256 '7eac715004b80225b88738960c09ff8b46c3cd8fa3a085d379b3eee9f8a5a573'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.0/mqsubscriber_v0.7.0_darwin_amd64.tar.gz'
      sha256 '5bc0b8bc04f7bd6ca660bf56edabf3fc9f198fe00fa51c4271ccd733e02e6cbf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.0/mqsubscriber_v0.7.0_linux_arm64.tar.gz'
      sha256 '7921bedfa533bd281a7afa453a026b381b317275ec9e39f5c80e87e09ad41fc6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.0/mqsubscriber_v0.7.0_linux_amd64.tar.gz'
      sha256 '9c92e06b2e94a9a713aa2ff7a8e2aa970f7fee6d1e0018ec147bc69a3fe7cee4'
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
