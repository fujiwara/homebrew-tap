class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.1.1'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.1/awslim_0.1.1_darwin_arm64.tar.gz'
      sha256 '9bd9d0cefed140bc685841adf0526ba1a9d21ddc8c87b2b3b703cd23e61538b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.1/awslim_0.1.1_darwin_amd64.tar.gz'
      sha256 '217f2932a62ea64b4898ab86bf50ea959e3285637705f7ee47de7b1a9d748afe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.1/awslim_0.1.1_linux_arm64.tar.gz'
      sha256 '6f89faf684424bbd002023b4adac4d2f4922d86fc9f39011d0775b16f388bb97'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.1/awslim_0.1.1_linux_amd64.tar.gz'
      sha256 'de4ab5b68104e6bc9f7a4acf7674c5b596885786abb60e6add5bd1135eded88b'
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
