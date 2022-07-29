class Lambroll < Formula
  version '0.13.0'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.13.0/lambroll_v0.13.0_darwin_amd64.zip"
    sha256 '3612245820beb1166c62dcd340a40569174a54886d6397b5d0f971c0c52dd201'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.13.0/lambroll_v0.13.0_linux_amd64.tar.gz"
    sha256 '9e6375bd243397a2d07699c517af5582c39fe4d99bd4d3f0963a630fed7b3b46'
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
