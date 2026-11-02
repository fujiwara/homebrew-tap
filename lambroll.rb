class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.6.0'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.0/lambroll_v1.6.0_darwin_arm64.tar.gz'
      sha256 'a8759bfe9d89a4902b4c486438c85f8c38f795ba3a1ae1da539fadf0d9b92e3d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.0/lambroll_v1.6.0_darwin_amd64.tar.gz'
      sha256 'a4bf00715afafbd69e04ef72dcd7dfe4984eb4006ef0ff1ce639176b557446d8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.0/lambroll_v1.6.0_linux_arm64.tar.gz'
      sha256 'c29819c0eb28a96e9c6f7e5d78987628920852ad9991a8ff9dd700d87035a978'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.0/lambroll_v1.6.0_linux_amd64.tar.gz'
      sha256 'e856af90f1b77816c1b079faafacef2c48565ca3d8ded364fd9b8f0e13eed9d9'
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
