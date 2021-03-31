class Lambroll < Formula
  version '0.11.0'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.0/lambroll_v0.11.0_darwin_amd64.zip"
    sha256 '34928392544e2d44edf4383c7ab9341ff4c67a13f6865d9c904997c196f86d9d'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.0/lambroll_v0.11.0_linux_amd64.tar.gz"
    sha256 'f2855c7f6dbde774035a4d95011389e6e6668f5b4ade0b1024041b2c4e30193e'
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
