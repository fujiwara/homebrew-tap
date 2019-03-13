class Kinesis-Tailf < Formula
  version '0.1.1'
  homepage 'https://github.com/fujiwara/kinesis-tailf'
  url "https://github.com/fujiwara/kinesis-tailf/releases/download/v0.1.1/kinesis-tailf-v0.1.1-darwin-amd64"
  sha256 'a97f91dc4d99c4be1667b1af803784cb4ce28e00073e5a5bf6e1347e03413acd'
  head 'https://github.com/fujiwara/kinesis-tailf.git'

  def install
    bin.install 'kinesis-tailf'
  end
end
