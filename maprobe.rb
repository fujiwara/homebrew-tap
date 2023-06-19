class Maprobe < Formula
  version '0.6.0'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.6.0/maprobe_v0.6.0_darwin_amd64.zip"
    sha256 'aa1c39420931fcf9ae09aff68fc14564189c407a584b2154f17492d5c3bcf8c6'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.6.0/maprobe_v0.6.0_linux_amd64.zip"
    sha256 '7f4ff2187a9c8f3b812d411f0b13b4e46a17fdd41956c320d8c5a686ab1d81d8'
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
