class Lambroll < Formula
  version '0.9.3'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.9.3/lambroll_v0.9.3_darwin_amd64.zip"
    sha256 'f7f135e59c4c38e41ee8d80ce8c4fb5a387230d4382e59512c64806ad0cac41b'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.9.3/lambroll_v0.9.3_linux_amd64.tar.gz"
    sha256 '087d00a9113a5b2111aa8539136b701071138423b4059c2ddc6b55568a506c40'
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
