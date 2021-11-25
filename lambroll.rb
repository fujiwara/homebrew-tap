class Lambroll < Formula
  version '0.12.3'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.3/lambroll_v0.12.3_darwin_amd64.zip"
    sha256 '16fc7e4b7bd35825a57cb610bc65b329baf4605ef9e7042601d8d0c14a1031c1'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.3/lambroll_v0.12.3_linux_amd64.tar.gz"
    sha256 '4a2b170b5a83f19f465cd5de60ef6b4fd3b0c9a2f1464d8408983e1d4ff48ea5'
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
