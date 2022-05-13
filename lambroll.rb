class Lambroll < Formula
  version '0.12.9'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.9/lambroll_v0.12.9_darwin_amd64.zip"
    sha256 '508a3a942bbbe3a54a80351b1d71d7befbc2b754e9750828fe5784639bedef46'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.9/lambroll_v0.12.9_linux_amd64.tar.gz"
    sha256 '8e405dcbc43eff904e1b134e9ce839c2e229e01e6c9c750714012d8c8035f10e'
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
