class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.2/lambroll_v1.0.2_darwin_arm64.tar.gz'
      sha256 '1b81ff13451a049ea5a15cf0e5fe47c03a07d2c874fa42cbfe2cbfbe30406850'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.2/lambroll_v1.0.2_darwin_amd64.tar.gz'
      sha256 '017cdcf16345d1683f935e7203a5a679a1740c7acbed30af28a1a8d0d8600d6a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.2/lambroll_v1.0.2_linux_arm64.tar.gz'
      sha256 'c820d332a03ee31fc4368b55bbe03e538561f975c2943d190daaa91d7f5984ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.2/lambroll_v1.0.2_linux_amd64.tar.gz'
      sha256 '84c59a9d1fa345763df2b1cf0ff6fc87ba0db90b8de3cc11645c612c26506638'
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
