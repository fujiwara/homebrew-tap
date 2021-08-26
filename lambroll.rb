class Lambroll < Formula
  version '0.11.7'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.7/lambroll_v0.11.7_darwin_amd64.zip"
    sha256 '3eb607f5f73be81aee930277665c2fb6d629edda5a88070adc1b9ab18f960887'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.7/lambroll_v0.11.7_linux_amd64.tar.gz"
    sha256 'c886f48985484dadc0f045cdadc2d5b62802ea4c3a266484e4cadb79e534d1aa'
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
