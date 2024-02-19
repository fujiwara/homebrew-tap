class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.5.1'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.1/cfft_0.5.1_darwin_arm64.tar.gz'
      sha256 'd6869a5d2d6c6e1c9d036138542c40cc5ee505ee13c5f139208d14d6b0c00775'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.1/cfft_0.5.1_darwin_amd64.tar.gz'
      sha256 'd87c1dcd6b372b7fa8f0249a1cd4981a029f95690465b6efdce1f11c9695200b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.1/cfft_0.5.1_linux_arm64.tar.gz'
      sha256 'fb43cfe20f37f7acf58fb3a6716dab203777ed88fe3f8637eb4d5d05d22b660a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.1/cfft_0.5.1_linux_amd64.tar.gz'
      sha256 '3cdb2111aaa89f9bd46422ffe2547ce4684aebcb4df41a00a300fa1688855526'
    end
  end

  head do
    url 'https://github.com/fujiwara/cfft.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cfft'
  end
end
