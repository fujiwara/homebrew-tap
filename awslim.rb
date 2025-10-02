class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.4.5'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.5/awslim_0.4.5_darwin_arm64.tar.gz'
      sha256 '5a19fb7e0a53df710e2fdd6ea42d65ff1d78f417a23d0791a733ff60e4c48993'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.5/awslim_0.4.5_darwin_amd64.tar.gz'
      sha256 'a90e879a98342fc2420a520538e8e53c0f6d564f44611bdd3bacb8884bccb944'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.5/awslim_0.4.5_linux_arm64.tar.gz'
      sha256 'afabec7ad00ac071a0f0cdf50f57dc4086894c8276b13869a5258922378e6c9d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.5/awslim_0.4.5_linux_amd64.tar.gz'
      sha256 'cddc8f95d9fcbe0e9ee9aede532d82644d5f4bc20a995e943e0ec291dc233784'
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
