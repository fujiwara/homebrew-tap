class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.13'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.13/jsonnet-armed_0.0.13_darwin_arm64.tar.gz'
      sha256 '42c6737a34bcb5347504ddfa8c7bca272c5390e42f6642e09677427e2b2a1988'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.13/jsonnet-armed_0.0.13_darwin_amd64.tar.gz'
      sha256 '91fe6bcf23571340783657dacb2f178ade21e1a276c9a2ad973390b3ae18d12e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.13/jsonnet-armed_0.0.13_linux_arm64.tar.gz'
      sha256 'dd87cc7a7c666570a8a6cbeea7abd2115ff30ef264605a68ccf9adabfbdbf95c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.13/jsonnet-armed_0.0.13_linux_amd64.tar.gz'
      sha256 '5c2d71fec372ae5d29eeec8e16b04ec087921ef958b2956965eb44b2cc1eafb4'
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
