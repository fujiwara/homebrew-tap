class Lambroll < Formula
  version '0.12.8'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.8/lambroll_v0.12.8_darwin_amd64.zip"
    sha256 'ab4405474ee9f1df3172753840ef57ac3730928646dd7185b34e744b1551f80f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.8/lambroll_v0.12.8_linux_amd64.tar.gz"
    sha256 '896dc475d9c842b1003439089921e981a78b79116e7bdf720155b32384cb4ed7'
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
