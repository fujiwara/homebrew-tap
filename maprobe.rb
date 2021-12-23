class Maprobe < Formula
  version '0.4.3'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.3/maprobe_v0.4.3_darwin_amd64.zip"
    sha256 '3521f0db30c4e881fc4c17deca3ba951b22d4f9d5efb4d29240a50335fda701f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.3/maprobe_v0.4.3_linux_amd64.zip"
    sha256 '0cd29843a48f995e1c92ba40784a329ed4010884c8c9fdece5f6f96bb92315f2'
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
