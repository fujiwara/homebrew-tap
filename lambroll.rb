class Lambroll < Formula
  version '0.8.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.8.0/lambroll_v0.8.0_darwin_amd64.zip"
  sha256 '0aaab25742cf755600c0b516ba4dd744135dece55549bd2bf186795bdc9e1d24'
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
