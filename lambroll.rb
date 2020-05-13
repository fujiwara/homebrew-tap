class Lambroll < Formula
  version '0.6.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.6.0/lambroll_v0.6.0_darwin_amd64.zip"
  sha256 '09424306aa7b025f1cdf92db25d1e4583b9d3297da3767aed17e0c49d6486755'
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
