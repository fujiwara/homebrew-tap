class Lambroll < Formula
  version '0.9.1'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.9.1/lambroll_v0.9.1_darwin_amd64.zip"
    sha256 '14da5a8bb0afa39d3a2c4cd85fb2f954ed41677ce135795d820a097df2bfa558'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.9.1/lambroll_v0.9.1_linux_amd64.tar.gz"
    sha256 '53a6fe80006852891e7bd776aaf3dd132213cb226b660e313e3cc2a088df4c7b'
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
