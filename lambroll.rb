class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.3.1'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.1/lambroll_v1.3.1_darwin_arm64.tar.gz'
      sha256 'ee704219748cda1c4fd731ff85e82784efa78a56552e940db6c3662426ed7955'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.1/lambroll_v1.3.1_darwin_amd64.tar.gz'
      sha256 '811de719e63d87aa1b814409dcde3441ccf55e19481bcb7ca39978be6c611cc6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.1/lambroll_v1.3.1_linux_arm64.tar.gz'
      sha256 'cdf1e366b436605e68a4a84669e0aae11dae6ae82d3d6bd6adf7cfbbe470c131'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.1/lambroll_v1.3.1_linux_amd64.tar.gz'
      sha256 '7f73ce97f489b3e56c6f48412208de005dbd22f55df9ba4bf60708831bd9fa60'
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
