class Lambroll < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.3.1/lambroll_v0.3.1_darwin_amd64.zip"
  sha256 '39e2778a3011038aa85aaf0a4bb80462abe704374f9f3bac36a22250fea31c80'
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
