class Maprobe < Formula
  version '0.3.5'
  homepage 'https://github.com/fujiwara/maprobe'
  url "https://github.com/fujiwara/maprobe/releases/download/v0.3.5/maprobe_v0.3.5_darwin_amd64.zip"
  sha256 '8102feeed5c290de08b23c20107bcd4e2cd1947b403d269367fc85e794b8cd46'
  head 'https://github.com/fujiwara/maprobe.git'

  def install
    bin.install 'maprobe'
  end
end
