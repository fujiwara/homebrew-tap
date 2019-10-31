class Lambroll < Formula
  version '0.2.1'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.2.1/lambroll_v0.2.1_darwin_amd64.zip"
  sha256 '49777202e2cefb8ff35fefea493be35e6ee5eb1b2229da167a46b4e7688881cb'
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
