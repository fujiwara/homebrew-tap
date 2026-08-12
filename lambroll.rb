class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.5.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.2/lambroll_v1.5.2_darwin_arm64.tar.gz'
      sha256 'bfc40638577fe839f7f04fc69bd443ef5c6ddbd6d9240d1e77fed0ae6e70225d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.2/lambroll_v1.5.2_darwin_amd64.tar.gz'
      sha256 'f74ed0cb0ff47070fa428c5af76b27ac7ace1844a225e359f6a3221f868c0019'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.2/lambroll_v1.5.2_linux_arm64.tar.gz'
      sha256 '6b3d427d2db2cac09ca900f456f57bc367ca889f0d6b26c281a70d7086426181'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.2/lambroll_v1.5.2_linux_amd64.tar.gz'
      sha256 '2dc50fec5b37b999d4b58fe14d847e5047610c3656c4f4b0d216b1e6ef150a0c'
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
