class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.7.3'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.3/mqsubscriber_v0.7.3_darwin_arm64.tar.gz'
      sha256 'f83c45b2812d93796690973b74bcaa6b6a101b97951c518aa3ac0131a28efdb8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.3/mqsubscriber_v0.7.3_darwin_amd64.tar.gz'
      sha256 'd454ff9e4a6e31d24549f2123bd40342368d85971f76020891787a74b04266c8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.3/mqsubscriber_v0.7.3_linux_arm64.tar.gz'
      sha256 'e957fa902cd80f5e82f0f20e5fc9aaff7e8338358f730f11ceec4ce4da420ff0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.3/mqsubscriber_v0.7.3_linux_amd64.tar.gz'
      sha256 '740fb8c486144e6e561c2baa914b01d30114eb8d8ebb1e87f3759b1b684077c8'
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
