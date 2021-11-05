class Lambroll < Formula
  version '0.12.0'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.0/lambroll_v0.12.0_darwin_amd64.zip"
    sha256 'f7d5027385b7f7f6cddea9ecdf849a83d93d73795058c7c5c3da923e4db3b92d'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.0/lambroll_v0.12.0_linux_amd64.tar.gz"
    sha256 '62a34323aa3865d38f9a813e9e777e5d22a7dbb06927b4956798b47829b6df76'
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
