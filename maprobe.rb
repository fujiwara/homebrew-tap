class Maprobe < Formula
  version '0.3.6'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.3.6/maprobe_v0.3.6_darwin_amd64.zip"
    sha256 '0c710552dd3403f6ef087f14dcd451590543a07a30f4f46245ece7e195363360'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.3.6/maprobe_v0.3.6_linux_amd64.zip"
    sha256 'be27c02cd36d12b3ec3803bb965afa1749aeafbd4673d863b065d15dcdbb9732'
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
