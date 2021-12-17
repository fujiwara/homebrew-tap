class Lambroll < Formula
  version '0.12.6'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.6/lambroll_v0.12.6_darwin_amd64.zip"
    sha256 'fadb394ee977f66eb19a80bb20305fb582f6110eb4f248e5f8c4c42b16df2149'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.6/lambroll_v0.12.6_linux_amd64.tar.gz"
    sha256 '1882959bd1f6abf707abea3890dbab4a24246006972d26d7e11bd1c9a76cc919'
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
