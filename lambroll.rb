class Lambroll < Formula
  version '0.12.5'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.5/lambroll_v0.12.5_darwin_amd64.zip"
    sha256 '9d4c99a6e69809c559fe1458f53309ac0eaceabd4d3967171e2275d77187a3ed'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.5/lambroll_v0.12.5_linux_amd64.tar.gz"
    sha256 '5603fd794aeec851d56d9ce6b0f4eea495f671e6b2f83733f5100ad96c6bbd4e'
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
