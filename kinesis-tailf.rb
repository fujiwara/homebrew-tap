class KinesisTailf < Formula
  version '0.3.0'
  homepage 'https://github.com/fujiwara/kinesis-tailf'
  url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.0/kinesis-tailf_0.3.0_darwin_amd64.tar.gz"
  sha256 'b67afe1e1084e8e0d7f9768b1b23acaa0354983668c6cced84eadf326cd4185f'
  head 'https://github.com/fujiwara/kinesis-tailf.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kinesis-tailf'
  end
end
