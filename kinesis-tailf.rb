class KinesisTailf < Formula
  version '0.1.1'
  homepage 'https://github.com/fujiwara/kinesis-tailf'
  url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.1.1/kinesis-tailf-v0.1.1-darwin-amd64.zip"
  sha256 'fcb7e165fbe1c1b78d855b3dfb162ac168468165ec0e16c0ae65351d6d1b5290'
  head 'https://github.com/fujiwara/kinesis-tailf.git'

  def install
    system 'mv', 'kinesis-tailf-v0.1.1-darwin-amd64', 'kinesis-tailf'
    bin.install 'kinesis-tailf'
  end
end
