class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.6'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.6/awslim_0.3.6_darwin_arm64.tar.gz'
      sha256 'eeed1e78a3bd99ada9769ff30193ea18da64db1cb411a70eccf8fb33d0ef9c92'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.6/awslim_0.3.6_darwin_amd64.tar.gz'
      sha256 '9816922113ef88b4b5251b2d920d3909fb8602926e9d3f778cbce54f143bdf8e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.6/awslim_0.3.6_linux_arm64.tar.gz'
      sha256 'f3697fb5a7fdee64af04fb99dde46066bd01f35b79c2000679ffa4a858f5511a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.6/awslim_0.3.6_linux_amd64.tar.gz'
      sha256 '11e821969a0c2876cbe647b6f469303857fb409cd7faa4b6d1853cb612c3e0ff'
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
