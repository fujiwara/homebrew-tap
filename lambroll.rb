class Lambroll < Formula
  version '0.5.1'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.5.1/lambroll_v0.5.1_darwin_amd64.zip"
  sha256 'a6920cbec7afa565e12e5df79321abe7cfb08f244008b6e08519e10042dc8b76'
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
