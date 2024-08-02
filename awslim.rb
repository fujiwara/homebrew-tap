class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.2'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.2/awslim_0.3.2_darwin_arm64.tar.gz'
      sha256 'bc83908fc22813bc18d72cd8aac01abd144f9317663d8f4a318389f5a3a47d29'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.2/awslim_0.3.2_darwin_amd64.tar.gz'
      sha256 '92a344b1659e3a2d976063c69776b0a59c411a473750fbfda83df2c3868b970b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.2/awslim_0.3.2_linux_arm64.tar.gz'
      sha256 '3d66168a108b6524f6f1a2026d6f41b99b270b0be73c595414639563525ea7fd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.2/awslim_0.3.2_linux_amd64.tar.gz'
      sha256 'f3143fc185f3561d934a42e6ba06139ce62bbb7181d766ecc10db797f2fb355c'
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
