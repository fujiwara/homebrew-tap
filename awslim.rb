class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.4.1'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.1/awslim_0.4.1_darwin_arm64.tar.gz'
      sha256 'c0d92137c744ca70f6cd054ee3774fd8977d16357ec7301b150a99464a9a55ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.1/awslim_0.4.1_darwin_amd64.tar.gz'
      sha256 '864d9f53865aa7b6c8a6dd85efc1ef8c8ae6be342e01e5b7e047ebcd3a09b5e9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.1/awslim_0.4.1_linux_arm64.tar.gz'
      sha256 '74017fc136ad7f46f6adaf76345b8ce228ac4f2a51eee4c291b6e55699d452ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.1/awslim_0.4.1_linux_amd64.tar.gz'
      sha256 '711da3e06fda74f614c908f893b850a5f6be6ff2f633db19980b95a86dcd538a'
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
