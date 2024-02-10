class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.0'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.0/lambroll_v1.0.0_darwin_arm64.tar.gz'
      sha256 '42ce93e3b6562c1b0623d391be892b153382533da02e0f95399a6b2b83efc89f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.0/lambroll_v1.0.0_darwin_amd64.tar.gz'
      sha256 '82b2e0745c1d32c0ec0b57d40da71d9956c0a8fbd4ecaca312e853df1d3e08b2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.0/lambroll_v1.0.0_linux_arm64.tar.gz'
      sha256 '62d026bacef1ba1b58279b6f5b3a269e39ab04665e575559130cf06a43fa4a78'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.0/lambroll_v1.0.0_linux_amd64.tar.gz'
      sha256 '86e61b33000e3972766734c770a98ee8cbf0ab01e4ff1667036af28d523a4189'
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
