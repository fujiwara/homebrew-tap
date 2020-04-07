class Lambroll < Formula
  version '0.5.2'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.5.2/lambroll_v0.5.2_darwin_amd64.zip"
  sha256 'ace5a93d2066c74cd35a9c0063f67c16facba37f07e3345cfc0b864e864e9d99'
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
