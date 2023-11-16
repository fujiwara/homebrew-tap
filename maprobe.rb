class Maprobe < Formula
  version '0.6.2'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.6.2/maprobe_v0.6.2_darwin_amd64.zip"
    sha256 '4f29b4f60778ba52c38f800b321e7cfeb80db819fc33bc082a95b3d28d54eda3'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.6.2/maprobe_v0.6.2_linux_amd64.zip"
    sha256 '6ce6b2243de4d0edadcf9074988a635772545d4464826f3a6d851fb4c932767e'
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
