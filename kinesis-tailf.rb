class KinesisTailf < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/kinesis-tailf'
  if OS.mac?
    url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.1/kinesis-tailf_0.3.1_darwin_amd64.tar.gz"
    sha256 'f0016e455d6e2f74517530db4d634457dc31293400a410f725e481daa896eabb'
  end
  if OS.linux?
    url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.1/kinesis-tailf_0.3.1_linux_amd64.tar.gz"
    sha256 'e81bcd9c4fe0b4aec09dcb68c75f3c1796488968c97e53d70122b5796d879a56'
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
