class Maprobe < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.0/maprobe_v0.4.0_darwin_amd64.zip"
    sha256 '07ba03c76a939b6648a82a2590010d47945331c9528f253fc91ce52679d827f3'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.0/maprobe_v0.4.0_linux_amd64.zip"
    sha256 '38da65f09af4af86ae3fbc26b196f91c594217fba4a919557d90cf0dd28e7c8d'
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
