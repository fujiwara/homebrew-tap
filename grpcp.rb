class Grpcp < Formula
  desc 'gRPC stream file transfer server/client'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/grpcp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.3/grpcp_0.0.3_darwin_arm64.tar.gz'
      sha256 '8acace4555f2f5449c21e032442d6897a1ed6bfae95b97fb6f70aff140334b34'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.3/grpcp_0.0.3_darwin_amd64.tar.gz'
      sha256 '74474457a0da4f638d6396b5dd7710da76c051d6251f061e1d05f325c4fa1838'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.3/grpcp_0.0.3_linux_arm64.tar.gz'
      sha256 'e4d103fcc11d377f83ebf6870998c623bbfda0499f5e45609eb0bb5236dbaf86'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.3/grpcp_0.0.3_linux_amd64.tar.gz'
      sha256 '76b3a8f7f0fa25fa312f1aa8b28aa1088da65cdf89761bcde6a0ee1d34405d5e'
    end
  end

  head do
    url 'https://github.com/fujiwara/grpcp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'grpcp'
  end
end
