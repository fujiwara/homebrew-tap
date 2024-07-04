class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.0/awslim_0.3.0_darwin_arm64.tar.gz'
      sha256 'de215cd4cd7ca4b83060aa3aed7bf7cd99b3874eb93dd214ab21f148671f947d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.0/awslim_0.3.0_darwin_amd64.tar.gz'
      sha256 '49a333b4d49a0b433fb8a2281e5fa30e40efc3c7f3728958694a1575d8d96bab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.0/awslim_0.3.0_linux_arm64.tar.gz'
      sha256 '4b3c6f15b83c1832c87fdc5ca204f7f8916c57a25c28d7ed60ec5b6922e41182'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.0/awslim_0.3.0_linux_amd64.tar.gz'
      sha256 'b82c951d7f0fe43acc89928361b48bfa4faa949cd08e0b3bf7dc946db839cdd3'
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
