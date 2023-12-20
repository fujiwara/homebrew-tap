class Maprobe < Formula
  version '0.7.0'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.0/maprobe_v0.7.0_darwin_amd64.zip"
    sha256 '58b5cd689c976dc1ac946eacc5d86fbd951d6587a98f91745d297d977203e25c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.0/maprobe_v0.7.0_linux_amd64.zip"
    sha256 '1c45393e3384c0528c5a885794c64bdaa32ba63172bd0f200a2d30c040662eb0'
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
