class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.3'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.3/awslim_0.3.3_darwin_arm64.tar.gz'
      sha256 '4c6929abe395576d4487fd06e49b6a70dc14a0a7dec348a57f48f508378c4eba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.3/awslim_0.3.3_darwin_amd64.tar.gz'
      sha256 'cf1cf1340db8d372814442b22939495a32cf1d836ca5e02d6078b5444645c313'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.3/awslim_0.3.3_linux_arm64.tar.gz'
      sha256 '276799533bf5b617c5d8aca7865b39fcb12d869228a854450c8c465f047ec943'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.3/awslim_0.3.3_linux_amd64.tar.gz'
      sha256 'ec2ab9804f7f9d792e0b85bd2427ff89b391696cffa3ba3fd02424e888c3ebd2'
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
