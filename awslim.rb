class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.11'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.11/awslim_0.3.11_darwin_arm64.tar.gz'
      sha256 '41b62bd8fd6d57f9eefef7d4afde72f97f3d1f0284f2eb5e7c31d822f845a7e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.11/awslim_0.3.11_darwin_amd64.tar.gz'
      sha256 '2a1bb95e5757cc8302dedeeabbae389db6db1b2a836a5e61bc9729155550ad3a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.11/awslim_0.3.11_linux_arm64.tar.gz'
      sha256 '7edd43eb216deea2a1e162a5f9d27de310c1da4a436f44fb0b9091f72fbf0854'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.11/awslim_0.3.11_linux_amd64.tar.gz'
      sha256 '27a86b4df5f0a5325cddcd52b90b0efef6c6f54ee269433dc00f4f8fd37342af'
    end
  end

  head do
    url 'https://github.com/fujiwara/awslim.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'awslim'
  end
end
