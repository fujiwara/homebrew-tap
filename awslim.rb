class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.7.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.0/awslim_0.7.0_darwin_arm64.tar.gz'
      sha256 'f884115e50b24165a715f2319c8cc13db4ae64f64d01562f1abc3ea3ca41624d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.0/awslim_0.7.0_darwin_amd64.tar.gz'
      sha256 'b23827eeb15048623e24811f13da03741cce1c6bc6dfd8d7c2b0e3b1338c4bac'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.0/awslim_0.7.0_linux_arm64.tar.gz'
      sha256 '8407e8975f387791202600934f4ff4d77533595a1f0421dfb25d301cb9be9234'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.0/awslim_0.7.0_linux_amd64.tar.gz'
      sha256 'e02364300c1e25ef72d1d08a53b39a9b9cfad79a00421e0120a89254ccb11a93'
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
