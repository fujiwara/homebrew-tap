class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.3.1'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.1/mqbridge_v0.3.1_darwin_arm64.tar.gz'
      sha256 'f6c3dac9f19df679b11ef6a37f8f3c0a246650cd76c0f65e987a9fe3e5269a7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.1/mqbridge_v0.3.1_darwin_amd64.tar.gz'
      sha256 '4ce436f0aa655eb1fe2540b6338a2a88fbba0105c9aec4bc1283d02bbb3e1cd5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.1/mqbridge_v0.3.1_linux_arm64.tar.gz'
      sha256 'ae0ae960cad9845cbc8f4ff9dfb87757b4096cef5cff02dbc69cc16ea1799d13'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.3.1/mqbridge_v0.3.1_linux_amd64.tar.gz'
      sha256 'cd8e11138fc0f49e92eab443c8f3d38796a101d285296ff46ac06196c7af98de'
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
