class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.3.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.2/lambroll_v1.3.2_darwin_arm64.tar.gz'
      sha256 '60c26b7d14e7369db61fb3f47265f7c3f42a354f33d37953bf28aaf45fdf6964'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.2/lambroll_v1.3.2_darwin_amd64.tar.gz'
      sha256 'fd4fd2508dd86cf358b554f1edd6b03def07baf2ed8871094672560f6a49269a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.2/lambroll_v1.3.2_linux_arm64.tar.gz'
      sha256 '140dd1e519a50626a9b62c1f4ac3421180585f15054256006225bd252e8ff822'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.2/lambroll_v1.3.2_linux_amd64.tar.gz'
      sha256 '3a906068bddd2dc97b84d540a652dc41975619003dec1e69756479baed091488'
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
