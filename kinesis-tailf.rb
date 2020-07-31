class KinesisTailf < Formula
  version '0.2.1'
  homepage 'https://github.com/fujiwara/kinesis-tailf'
  url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.2.1/kinesis-tailf_0.2.1_darwin_amd64.tar.gz"
  sha256 '7b84c53c34873593f83910e50704b3bac637ebec0676432cb5d11afb1bdff80f'
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
