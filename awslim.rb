class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.7.1'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.1/awslim_0.7.1_darwin_arm64.tar.gz'
      sha256 '848d2b0915e6bd83ee68a51d21922d8d14c4412813dc10c1c9bea4c5a58f9744'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.1/awslim_0.7.1_darwin_amd64.tar.gz'
      sha256 '955d5ebade42aa8bb052f181f58e78d6ef0826dc9aec67e6fc42d0369753e51f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.1/awslim_0.7.1_linux_arm64.tar.gz'
      sha256 'faf79a29b49eb2333711bae2b86162a5d6dae56069a4c38804704c9a4650bd91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.7.1/awslim_0.7.1_linux_amd64.tar.gz'
      sha256 '8495751f3c3760b7798560653b81fe71fdad40a394c670fb86261b21e29da31a'
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
