class Sardine < Formula
  version '0.2.1'
  homepage 'https://github.com/fujiwara/sardine'
  url "https://github.com/fujiwara/sardine/releases/download/v0.2.1/sardine_darwin_amd64.zip"
  sha256 '10f89968df044682f281fbb770e0cb4355ac3332cb8885ff72c187880aa277e9'
  head 'https://github.com/fujiwara/sardine.git'

  def install
    bin.install 'sardine'
  end
end
