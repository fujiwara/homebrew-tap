class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.4.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.2/lambroll_v1.4.2_darwin_arm64.tar.gz'
      sha256 '2d11e4fbb8c81d76da2f518d1520a7a104fa466c6d5d42c621bbcbe7c255acaa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.2/lambroll_v1.4.2_darwin_amd64.tar.gz'
      sha256 '28e68c98a3d256e3021fa1c20dd930b0a8a3a04d8e9fd5a89579a43505b6e323'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.2/lambroll_v1.4.2_linux_arm64.tar.gz'
      sha256 'a21fdb902f5cdbf39b93b80badee2cefd97d3d9c5fb22f3730c3839c05199dbe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.2/lambroll_v1.4.2_linux_amd64.tar.gz'
      sha256 '61faa56e6edaa7ffcbedd8f54b86f60a4f2ccde0f9dacc3dcc94ffe5f37a7c72'
    end
  end

  head do
    url 'https://github.com/fujiwara/lambroll.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
      system 'mv', 'cmd/lambroll/lambroll', '.'
    end
    bin.install 'lambroll'
  end
end
