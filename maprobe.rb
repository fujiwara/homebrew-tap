class Maprobe < Formula
  version '0.10.3'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.10.3/maprobe_0.10.3_darwin_amd64.tar.gz"
    sha256 '1276bee00015d8b266af6db6f71e81d5805d8796024fce2f94b5e7d739f28747'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.10.3/maprobe_0.10.3_linux_amd64.tar.gz"
    sha256 '60ad3a419bcb9cd957c89d25265ed9dfeea03755fa907502f2531e2fe17e6db0'
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
