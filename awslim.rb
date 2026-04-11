class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.6.13'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.13/awslim_0.6.13_darwin_arm64.tar.gz'
      sha256 '1cc61717f883037f00c1312f6747acb3a0fcb381a60aa9ab3a4bc0eef5ccb838'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.13/awslim_0.6.13_darwin_amd64.tar.gz'
      sha256 'b2cd2d5df48b6d92c1b2bc7f325b932711381d46341c19c649ae40a2eba7cfd7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.13/awslim_0.6.13_linux_arm64.tar.gz'
      sha256 'ace23e376e0acad1e9ecf82e37fdf722c368d08b4ee10e3f43b02361bc2f1189'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.13/awslim_0.6.13_linux_amd64.tar.gz'
      sha256 'eb2fd4bedbf0973c98e64097a4396b99547343fed771667a18ea84812953eaa6'
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
