class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.5.3'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.3/lambroll_v1.5.3_darwin_arm64.tar.gz'
      sha256 'fb21b2875e241530f07d211216dc0138a95dad51a2a1a016bd66786c8e0dfb6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.3/lambroll_v1.5.3_darwin_amd64.tar.gz'
      sha256 '9b1ba3bbac189d60d0322d4a7b821f1b3d378cdabee25f2396da050c5f806928'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.3/lambroll_v1.5.3_linux_arm64.tar.gz'
      sha256 '1bf9405facf50703cd641b88d13e2b939fe6932015d1f25137311d9b4108b2d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.3/lambroll_v1.5.3_linux_amd64.tar.gz'
      sha256 '0fa88a5e820627bb7f115acb513a6f5f5f999a31974704708926e3c0b5251648'
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
