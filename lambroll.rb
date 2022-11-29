class Lambroll < Formula
  version '0.14.0'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.14.0/lambroll_v0.14.0_darwin_amd64.zip"
    sha256 'f3530eb92f0c7b9a876048bcfbb6e7b5a206e97778d1648548aea24bf3354242'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.14.0/lambroll_v0.14.0_linux_amd64.tar.gz"
    sha256 'b667dff4f4002768a444af00539ca6e43760740f8616683d4184b7bb09605153'
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
