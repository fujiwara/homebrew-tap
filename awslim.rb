class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.1'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.1/awslim_0.3.1_darwin_arm64.tar.gz'
      sha256 'e2248061c7bfd2d80db38865c13087a762fcfac3ea87790c3baa1f07f1a1ee55'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.1/awslim_0.3.1_darwin_amd64.tar.gz'
      sha256 '3c655e0148acf18c1aed5edc6bac4acc8ce956757ac6622beb29799d815bbb52'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.1/awslim_0.3.1_linux_arm64.tar.gz'
      sha256 '8f9f0eb961e4c3c9276d96e25a632d61fc12d2e18597c14f58b787d5f2232c0c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.1/awslim_0.3.1_linux_amd64.tar.gz'
      sha256 'ee7c97da236fb01a84bb7ff9744c3ebb1e65b64dfb4a07a6faadea0b149546cf'
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
