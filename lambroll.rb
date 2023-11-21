class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '0.14.7'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.7/lambroll_v0.14.7_darwin_arm64.zip'
      sha256 '98bdadc5a82f037c36125dc93788d4d3ad49d044259edaafdb68dd2940366b40'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.7/lambroll_v0.14.7_darwin_amd64.zip'
      sha256 '0cd36e3fc09dae728c1e21d23d0403f43e8331f3c60af1821f5fc3169c746e6f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.7/lambroll_v0.14.7_linux_arm64.tar.gz'
      sha256 'd50e71c027b68b531ec4360320fbd7aba5049564b76bfe495d6fae15aebea747'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.7/lambroll_v0.14.7_linux_amd64.tar.gz'
      sha256 '64e7fd840fdd2f10b5999e403a0b12551e878805745136a3d25c790c0d0ded94'
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
