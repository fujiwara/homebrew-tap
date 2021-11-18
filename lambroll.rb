class Lambroll < Formula
  version '0.12.2'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.2/lambroll_v0.12.2_darwin_amd64.zip"
    sha256 '46bef43b1304ebbe5128b83242169c27e72890181bebb303059d3516511898e0'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.2/lambroll_v0.12.2_linux_amd64.tar.gz"
    sha256 '09301f45a196006ca277de691a350271ef9ad47b3df412b89d28cbd38a20f6a0'
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
