class Maprobe < Formula
  version '0.7.2'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.2/maprobe_v0.7.2_darwin_amd64.zip"
    sha256 '9a257f9d5dba5291e9c3b3945bfe499aa15ad85f03d7c8e11baefd645877e2a7'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.2/maprobe_v0.7.2_linux_amd64.zip"
    sha256 'da21965db2d45e4bab5326a702512bdb2708cd6f35b8109f7c259fae797bb6d4'
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
