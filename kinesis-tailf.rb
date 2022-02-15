class KinesisTailf < Formula
  version '0.3.2'
  homepage 'https://github.com/fujiwara/kinesis-tailf'
  if OS.mac?
    url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.2/kinesis-tailf_0.3.2_darwin_amd64.tar.gz"
    sha256 'c109cb7cd5c873238e936aeb77bb142e62351aa6e0ad4393db95ad96997ab08e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.2/kinesis-tailf_0.3.2_linux_amd64.tar.gz"
    sha256 '09bfe49f412c4835fd40d2490b7ace3111e8fffa068f4f718893d44c1495ab4d'
  end
  head 'https://github.com/fujiwara/kinesis-tailf.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kinesis-tailf'
    bin.install 'kinesis-cat'
  end
end
