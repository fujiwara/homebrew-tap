class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.9.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.9.0/awslim_0.9.0_darwin_arm64.tar.gz'
      sha256 '4a9dbd9edc0170495a20fbabb07c9560b217b450ae5907d3cd2b4a4c0d1140f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.9.0/awslim_0.9.0_darwin_amd64.tar.gz'
      sha256 'c40f6c8cd9bda329b9bf26568829ece139bccdfe01e8e78088735e77851958e9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.9.0/awslim_0.9.0_linux_arm64.tar.gz'
      sha256 '31414a9d9727dbf96cbb372bc2766ca636a0d548170bd71050f16a6512d3c3b1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.9.0/awslim_0.9.0_linux_amd64.tar.gz'
      sha256 'a4afddb032276539bcf00e8f7616182fd4428aa93967e555c6860d0d0a0bc37d'
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
