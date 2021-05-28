class Lambroll < Formula
  version '0.11.3'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.3/lambroll_v0.11.3_darwin_amd64.zip"
    sha256 '4c052805b85c8bbeeed74ee27bbb189540bd0f782e9937d360b231c77a06bad8'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.3/lambroll_v0.11.3_linux_amd64.tar.gz"
    sha256 'e96c1929fbc61399c1778346138d46668869c9cdef338aff0b780d0c740cb7d9'
  end
  head 'https://github.com/fujiwara/lambroll.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'lambroll'
  end
end
