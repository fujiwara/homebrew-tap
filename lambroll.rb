class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.5.4'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.4/lambroll_v1.5.4_darwin_arm64.tar.gz'
      sha256 '281df919422d9785decdba88ed2f1839b988a6a9e35994906857540de93ddb72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.4/lambroll_v1.5.4_darwin_amd64.tar.gz'
      sha256 '115c553ced47fb2c1f8f7a6f8688a462df804d9df60b1c2c87fcd5a76ba19cfb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.4/lambroll_v1.5.4_linux_arm64.tar.gz'
      sha256 '9a8a3ad072180ad8ab26306e0b24a82f0fc4632f9b914a2be285256bc9b008ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.4/lambroll_v1.5.4_linux_amd64.tar.gz'
      sha256 '057c7719b2c56efbfdcd835a299b8ffa587333f53811c5ff7cd3ad6bfb890899'
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
