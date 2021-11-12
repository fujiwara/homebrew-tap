class Lambroll < Formula
  version '0.12.1'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.1/lambroll_v0.12.1_darwin_amd64.zip"
    sha256 '79bc9be06b8ecc6686a1a95e202254e441000ba707f4a00d7afff6e4444985d3'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.1/lambroll_v0.12.1_linux_amd64.tar.gz"
    sha256 'fdb378ed6800bf1ff800c39d96f485aa5cd26c60096c3e3f76f28921c36a647d'
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
