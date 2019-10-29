class Lambroll < Formula
  version '0.2.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.2.0/lambroll_v0.2.0_darwin_amd64.zip"
  sha256 'ea28b48d5df096ce254cf8e60cfc6ac2c5bc9be0fe7d1dc1e1dda975508ce2b6'
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
