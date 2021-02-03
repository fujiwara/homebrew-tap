class Maprobe < Formula
  version '0.4.2'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.2/maprobe_v0.4.2_darwin_amd64.zip"
    sha256 'b1b79aba0ca8b7f05749e4a97332546bbbdbade04023637c8b7893eee5ce435c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.2/maprobe_v0.4.2_linux_amd64.zip"
    sha256 '41207c8df23b481e55645ccd9d0413bc0d4861a7154cb328f08627367f4b57a9'
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
