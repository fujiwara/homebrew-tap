class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.15'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.15/jsonnet-armed_0.0.15_darwin_arm64.tar.gz'
      sha256 'a1c482e0d09339c3fb60621c473ccf5cbea0896219b1f0599906c418b0b086ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.15/jsonnet-armed_0.0.15_darwin_amd64.tar.gz'
      sha256 '53ec33db144ca81d5ceca05849fd21d58622643f13b47d474055aedb4aeddfff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.15/jsonnet-armed_0.0.15_linux_arm64.tar.gz'
      sha256 '71b415830444e45160d58855ec5dd81ea5d2f357e8c2b0fbf207da5c7383fdf1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.15/jsonnet-armed_0.0.15_linux_amd64.tar.gz'
      sha256 '31861ab08b66fe6db0047532e69b42ececad855b0a0898be9dbdcbf6a0f12ea1'
    end
  end

  head do
    url 'https://github.com/fujiwara/jsonnet-armed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'jsonnet-armed'
  end
end
