class Lambroll < Formula
  version '0.6.1'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.6.1/lambroll_v0.6.1_darwin_amd64.zip"
  sha256 '26363e57345192488919d31a1797004f834ce8c09ba44307e4396292dfe14d4c'
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
