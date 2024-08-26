class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.6.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.1/ecsta_0.6.1_darwin_arm64.tar.gz'
      sha256 '82e40d6e2288c4bd593dbc8e8df4487a9c344de1f564b895dde3bdc5f5d05d23'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.1/ecsta_0.6.1_darwin_amd64.tar.gz'
      sha256 'e18ce4bf0516d1a665fb63f62d9600712f97b8c855d9ecb714557b7ab5ff64c9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.1/ecsta_0.6.1_linux_arm64.tar.gz'
      sha256 'db0b42606f3796f63d5101f3d6033754480b322f16b9cbdc174839472b4e5ad9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.1/ecsta_0.6.1_linux_amd64.tar.gz'
      sha256 '3e951a954a028369d81a2c5f55569b8a4d246142fe468a182ba06d6bfc444361'
    end
  end

  head do
    url 'https://github.com/fujiwara/ecsta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
