class Lambroll < Formula
  version '0.14.2'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.14.2/lambroll_v0.14.2_darwin_amd64.zip"
    sha256 'af5346166791a63686340894864270bbed9c33f16f20a4a04f99bd6eb7f0f90e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.14.2/lambroll_v0.14.2_linux_amd64.tar.gz"
    sha256 'cd2a3f0b647356eddbfd8cf881dbfd1ca988ada3899f8c543f1203ae9d15b1a7'
  end
  head 'https://github.com/fujiwara/lambroll.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
      system 'mv', 'cmd/lambroll/lambroll', '.'
    end
    bin.install 'lambroll'
  end
end
