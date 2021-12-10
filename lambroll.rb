class Lambroll < Formula
  version '0.12.4'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.4/lambroll_v0.12.4_darwin_amd64.zip"
    sha256 'e4314eb00d1a9553b1c0d992eb64e1ee121b6bec68e3944ba36737fae4d1d2f9'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.12.4/lambroll_v0.12.4_linux_amd64.tar.gz"
    sha256 '90f525100ae338fe25110722346482521992cf20cd65e988a8fd80d46e5e49cb'
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
