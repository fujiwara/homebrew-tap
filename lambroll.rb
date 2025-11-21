class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.4.1'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.1/lambroll_v1.4.1_darwin_arm64.tar.gz'
      sha256 '9a6e1f17c2f9accf79e9444e78ef71291fb378c3194ea0645e8f33bb29bb2026'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.1/lambroll_v1.4.1_darwin_amd64.tar.gz'
      sha256 'e8f5b448d334e20f257d7d4f1025f7cd8d29157928435866ac64d112ba009ea3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.1/lambroll_v1.4.1_linux_arm64.tar.gz'
      sha256 '888ea7afb62fdb337d4aff47dcf1e737b49353b25247ebfa4e399d7c2cf2bd98'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.1/lambroll_v1.4.1_linux_amd64.tar.gz'
      sha256 'd85f1d9840e03d52953f27c4f5195049340ae0b9cdc6a400b61f267198a618bc'
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
