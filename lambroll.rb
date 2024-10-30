class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.1.3'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.3/lambroll_v1.1.3_darwin_arm64.tar.gz'
      sha256 'e28eb826b01581ce2dc65c59fb74ca57e6dbe3062ba5994643370d9e6868b6b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.3/lambroll_v1.1.3_darwin_amd64.tar.gz'
      sha256 'c5d5fd41340cc674e549a2099a97176b01f5e48c39b0bd97c9aa1c6e25b74f5f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.3/lambroll_v1.1.3_linux_arm64.tar.gz'
      sha256 'b5a69e2be13598519e750067599792a4fdb25ef5b0a5d8daccd79e75eb4ed2ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.3/lambroll_v1.1.3_linux_amd64.tar.gz'
      sha256 '827d3b2f1f99018e996c9eeffbce58ee098b525e68bb0c044a9d96d1898e67f5'
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
