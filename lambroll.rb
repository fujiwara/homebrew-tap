class Lambroll < Formula
  version '0.11.2'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.2/lambroll_v0.11.2_darwin_amd64.zip"
    sha256 '84a37c74e38ef8114b591499b7a8e220206f7d8e030d552d33964b0a5bd696af'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.2/lambroll_v0.11.2_linux_amd64.tar.gz"
    sha256 'c0a0af7cb75c1db7f31308d6393e49b44520558f8513889baae829743f9179ea'
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
