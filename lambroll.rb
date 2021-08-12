class Lambroll < Formula
  version '0.11.6'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.6/lambroll_v0.11.6_darwin_amd64.zip"
    sha256 '99f539e58bbb06f6cd7cd41b7747c196773a28b1bcc7cb06d867a790761c7d99'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.6/lambroll_v0.11.6_linux_amd64.tar.gz"
    sha256 '33ca267c1b22e35805e9d00607ef7c3b4177a14172d561e1db238fe2598edff9'
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
