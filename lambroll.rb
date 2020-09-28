class Lambroll < Formula
  version '0.9.2'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.9.2/lambroll_v0.9.2_darwin_amd64.zip"
    sha256 '9939de8990599cf0c05155fabc9b9ffd737f90c8c889bf11e48f35e28d2b4832'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.9.2/lambroll_v0.9.2_linux_amd64.tar.gz"
    sha256 '9c98ba6a0bb2eedfbcab83fedfd2e5c7a074ec1d2aa4ae618ef99753aff0df49'
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
