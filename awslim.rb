class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.2.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.2.0/awslim_0.2.0_darwin_arm64.tar.gz'
      sha256 '15515e37236d4c3c91576a0220a5a0d8ebe06d98dba07195eed6f53d12ab0cd6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.2.0/awslim_0.2.0_darwin_amd64.tar.gz'
      sha256 '50970307ae9a7ce866e240fc0c124010c5a7f9d2b7a5844c45aed79800bb8cb4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.2.0/awslim_0.2.0_linux_arm64.tar.gz'
      sha256 '4791ecae7e49edfa944a8eb7b88d2d06081fbe81c1fd79847d80c2f5107e0784'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.2.0/awslim_0.2.0_linux_amd64.tar.gz'
      sha256 '2a7e13fd236acb986bf163375cb8366701f9de1fa0e46f4437ffd5c6c720b25b'
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
