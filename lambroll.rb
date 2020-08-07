class Lambroll < Formula
  version '0.9.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.9.0/lambroll_v0.9.0_darwin_amd64.zip"
  sha256 '0f4d4ebb939a379d3b3b442e3200a4b43b54e6d25a341f46efb01cf095ce97a7'
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
