class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.7.2'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.2/awslim_0.7.2_darwin_arm64.tar.gz'
      sha256 'f681247b108e5884184ec2ac971b57671eec9f0e2761a2a2d66eb12ae9b2fb13'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.2/awslim_0.7.2_darwin_amd64.tar.gz'
      sha256 '115165a4fdead5cfc155f364ac4e02da1ffa2c5f11b476b1cc874b6b8924d52d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.2/awslim_0.7.2_linux_arm64.tar.gz'
      sha256 'e6b4053f474410d99af87098a179c4c65974a408930f20cfec5021f3b1d1c8e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.2/awslim_0.7.2_linux_amd64.tar.gz'
      sha256 '854d2c7b3fbfdf10a53ca678891e4ddebd97f8b1714f1c13b3614058a2cef04a'
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
