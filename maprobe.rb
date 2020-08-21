class Maprobe < Formula
  version '0.3.5'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.3.5/maprobe_v0.3.5_darwin_amd64.zip"
    sha256 '8102feeed5c290de08b23c20107bcd4e2cd1947b403d269367fc85e794b8cd46'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.3.5/maprobe_v0.3.5_linux_amd64.zip"
    sha256 '88e72e261121f5ff158dcd49ec09cc4a1ec78fcedb0882694d30fd0ceed78daf'
  end
  head 'https://github.com/fujiwara/maprobe.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maprobe'
  end
end
