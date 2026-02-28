class Mqbridge < Formula
  desc 'mqbridge is a replicator between RabbitMQ and Sakura SimpleMQ'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/mqbridge'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.3/mqbridge_v0.0.3_darwin_arm64.tar.gz'
      sha256 '9c6f263c9c4121911cefeea677814f920d9fe25db503069c81e5d2d4a34744e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.3/mqbridge_v0.0.3_darwin_amd64.tar.gz'
      sha256 '0ccac000ca507c71b80e898c0eb5846e56007864c6a4486823eabb48ba9650b8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.3/mqbridge_v0.0.3_linux_arm64.tar.gz'
      sha256 '8704d43b644ebb901af47dc5a6e69303c618998e54c4cc16a58c5c42b40d52d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqbridge/releases/download/v0.0.3/mqbridge_v0.0.3_linux_amd64.tar.gz'
      sha256 'ae53242cd4fe5132a1f7d43cdd4684f53860cf3bcad7ab825e155423f4a2409f'
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
