class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.6.12'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.12/awslim_0.6.12_darwin_arm64.tar.gz'
      sha256 '3f7fa83fb639368d0f854f161b7663f36e60f53cdcddf5695bda088ccd656992'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.12/awslim_0.6.12_darwin_amd64.tar.gz'
      sha256 'dd63ce3c59673e02d1b6c71f4e4f8a9206b7c2ddc8f36e55d17e8ba600bff0d2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.12/awslim_0.6.12_linux_arm64.tar.gz'
      sha256 '91fff3ad13a3475f9d416167d1c0ab450560d653a940cd0e0dbe99d402ee9c7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.12/awslim_0.6.12_linux_amd64.tar.gz'
      sha256 'e978fa587c96ba7c5ce37da9c0c8a4c32b5618706cec1013a5f580a3bb6c7f74'
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
