class Lambroll < Formula
  version '0.1.2'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.1.2/lambroll_v0.1.2_darwin_amd64.zip"
  sha256 '36f74f1657ca7568c81ba2a6ea6a3f9c0d83418b6069ba023a8e51bfdfa713cb'
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
