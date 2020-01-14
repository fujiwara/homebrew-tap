class Lambroll < Formula
  version '0.3.3'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.3.3/lambroll_v0.3.3_darwin_amd64.zip"
  sha256 '3f5014a962c75a04eb7a52f346407446d038001f39a9ba024aaa181744901bfd'
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
