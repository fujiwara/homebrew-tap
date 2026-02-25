class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.1.1'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.1/jsonnet-armed_0.1.1_darwin_arm64.tar.gz'
      sha256 'c8c4f3052b630b226374acfef181f71029d222bdf31d252a4219a56a7ac259e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.1/jsonnet-armed_0.1.1_darwin_amd64.tar.gz'
      sha256 '088de69b35b1c7eada54e7e6d390fbef446f33115796fc60570c8adc4784cc46'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.1/jsonnet-armed_0.1.1_linux_arm64.tar.gz'
      sha256 '26e62c47c41a81efebf8ddbe6c3b134ce34437220b3917e47c1c2b0dd7208545'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.1/jsonnet-armed_0.1.1_linux_amd64.tar.gz'
      sha256 '800bdd55f2d7c1cb7fba40a9365581469a365fee92590c81e0dabf41da0a2ec5'
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
