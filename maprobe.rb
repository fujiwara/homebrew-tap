class Maprobe < Formula
  version '0.6.1'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.6.1/maprobe_v0.6.1_darwin_amd64.zip"
    sha256 '72d792ced82638fd9df21b896df34f41d26e2e42581456cecf05e9e441efbe90'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.6.1/maprobe_v0.6.1_linux_amd64.zip"
    sha256 'd0dec5c1a21b599db3933599ae3136e6f01dff0cb0856aa6e4590125f8e4811b'
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
