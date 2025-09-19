class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.7.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.1/ecsta_0.7.1_darwin_arm64.tar.gz'
      sha256 'b05fbe0a63a88c2db1c8baece0736061560cd0aef150f3c29fe7851decf9c84d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.1/ecsta_0.7.1_darwin_amd64.tar.gz'
      sha256 '28821adc815dfe3b537949b20ffda68db09bd116a7ab30f03d1d500b00418770'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.1/ecsta_0.7.1_linux_arm64.tar.gz'
      sha256 '09247d9e67fd6b71f566a5b3377570ec324e8e561c74c72cf407caf676a05087'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.1/ecsta_0.7.1_linux_amd64.tar.gz'
      sha256 '6b37075bd67e6b8327b299ba280c82fec81253f402bb08f855eb6bbae7043a3e'
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
