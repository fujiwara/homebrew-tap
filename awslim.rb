class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.1.3'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.3/awslim_0.1.3_darwin_arm64.tar.gz'
      sha256 '6529dc7bf24ebb5388d452f41f4e90a143c875c0ebab9f74bff97f0544f5ae2d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.3/awslim_0.1.3_darwin_amd64.tar.gz'
      sha256 'a4bdf4535b5d617026158d42cc95c969f2524ebcb2e005affb91b314f9dd203b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.3/awslim_0.1.3_linux_arm64.tar.gz'
      sha256 '4ffdb825f5e9e4cadeed381dba0574636c093f530472d3a2cb54518139efdbd7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.3/awslim_0.1.3_linux_amd64.tar.gz'
      sha256 '3f82938808d5bade2dcf748d290adc6bf9810fa642c642a0b60c0c9b5416a062'
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
