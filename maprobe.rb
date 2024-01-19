class Maprobe < Formula
  version '0.7.1'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.1/maprobe_v0.7.1_darwin_amd64.zip"
    sha256 '043551463bdc5174a1b46c591d5e2ada5d6bcf1d6bc2ce8b03aea0c28cd3572d'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.1/maprobe_v0.7.1_linux_amd64.zip"
    sha256 'c0421e27e935bf2e735797ea789517c8f6e437eb2a6d2c3e382391c188cb681b'
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
