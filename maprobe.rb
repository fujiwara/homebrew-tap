class Maprobe < Formula
  version '0.10.4'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.10.4/maprobe_0.10.4_darwin_amd64.tar.gz"
    sha256 'ca6a9294e2ea8b7384c1994b85b7cf695c4010f57871b9e9df6985fda740766c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.10.4/maprobe_0.10.4_linux_amd64.tar.gz"
    sha256 '5711626bc05bbac8ac8067fec4771b1a1187c8d6ad58dbc34418db739bbb7f10'
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
