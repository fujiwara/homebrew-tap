class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.6.2'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.2/awslim_0.6.2_darwin_arm64.tar.gz'
      sha256 '869544f093a181befa89ed8e2413a0e7002df2a550740eefe9be094454b727e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.2/awslim_0.6.2_darwin_amd64.tar.gz'
      sha256 '6fb749735cf7999ecb7537e956faef0dc429cbae6a9bf4dfd530be5997a957ab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.2/awslim_0.6.2_linux_arm64.tar.gz'
      sha256 '20b947d5e749068d0af658f6c5a58480da14c873dd61b4d0d2494359084cc41b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.6.2/awslim_0.6.2_linux_amd64.tar.gz'
      sha256 'e69054be8b7b087d86038e8301354548f952edc4943cf72ac0084b0d06047d1f'
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
