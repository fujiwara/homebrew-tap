class Lambroll < Formula
  version '0.11.5'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.5/lambroll_v0.11.5_darwin_amd64.zip"
    sha256 'a72b1e048fab6fd99aa5508bcbf03092828679e6709a2264f71ccc04b0b5d083'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.5/lambroll_v0.11.5_linux_amd64.tar.gz"
    sha256 '2b0604b0f4bbd0c8b6a8a9458a2f52be799d8625117cfe36263151b956c6c290'
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
