class Ecsta < Formula
  version '0.1.3'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.1.3/ecsta_0.1.3_darwin_amd64.tar.gz"
    sha256 '95b483ec27b6957f75927c6a14e8e5a4ca66fe05209988807b65a506edbd5add'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.1.3/ecsta_0.1.3_linux_amd64.tar.gz"
    sha256 'c5798576eca550815269a07e69dd976957b8de1259d71ad3bca092bc674cf765'
  end
  head 'https://github.com/fujiwara/ecsta.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
