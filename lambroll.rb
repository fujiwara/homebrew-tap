class Lambroll < Formula
  version '0.12.7'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.7/lambroll_v0.12.7_darwin_amd64.zip"
    sha256 '6c09b6a0ff8a7726016153375d7d07aec6682a5ea97c55047c28807f6d77704e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.7/lambroll_v0.12.7_linux_amd64.tar.gz"
    sha256 '755df6fe6ce070aabbeab806a7c980b6cc2d06a003684c8e68b9bb30d4121a0e'
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
