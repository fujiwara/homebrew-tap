class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.4.4'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.4/lambroll_v1.4.4_darwin_arm64.tar.gz'
      sha256 'c7f7ca82b0ffe281b97e8b40b8e986c08dddd48c4e44907f004bbff269f9a1eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.4/lambroll_v1.4.4_darwin_amd64.tar.gz'
      sha256 'f9ebe256c5b724a7424253a99febc3198f29abbab832bd04649237da3a39100a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.4/lambroll_v1.4.4_linux_arm64.tar.gz'
      sha256 'b3c193389525a0e84d1593ecb86f753fae2d92bac1f7b3cbd0a14877c6bad2bb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.4/lambroll_v1.4.4_linux_amd64.tar.gz'
      sha256 'bd1e4b403b92417b53cdc3d2fb89ca267b98c24f6dd1df93cae3e413d807e680'
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
