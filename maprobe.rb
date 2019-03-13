class Maprobe < Formula
  version '0.2.4'
  homepage 'https://github.com/fujiwara/maprobe'
  url "https://github.com/fujiwara/maprobe/releases/download/v0.2.4/maprobe_darwin_amd64.zip"
  sha256 'cebedd2a79cb9ac5f695b044170a360d3f89fefbc9a91cff4b977d55995aa9f1'
  head 'https://github.com/fujiwara/maprobe.git'

  def install
    bin.install 'maprobe'
  end
end
