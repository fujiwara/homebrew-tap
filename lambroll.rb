class Lambroll < Formula
  version '0.3.4'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.3.4/lambroll_v0.3.4_darwin_amd64.zip"
  sha256 '85abb34503276f91a84e1ec9e43ffa79a9cfaa43a0ea03346f62a101a1b1feb4'
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
