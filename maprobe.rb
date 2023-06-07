class Maprobe < Formula
  version '0.5.4'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.5.4/maprobe_v0.5.4_darwin_amd64.zip"
    sha256 '38a18fa84c372ca1ecd6b90bdf137bfb74d3e106db1d3c1d010677f37b45ad20'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.5.4/maprobe_v0.5.4_linux_amd64.zip"
    sha256 '79a41134679eb05989feda75f58d6dbb379bffa590a4cf9053305bc7a076db5e'
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
