class Maprobe < Formula
  version '0.9.1'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.9.1/maprobe_0.9.1_darwin_amd64.tar.gz"
    sha256 '2145d55a353874151a2d4ad8b48161a0b7b1cddb2618584638f5192e0004d92a'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.9.1/maprobe_0.9.1_linux_amd64.tar.gz"
    sha256 '9d0d4a7dd2c9b0f3901ee999e6acccf0e6cde2b026f14530a2ef45d4228a7a80'
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
