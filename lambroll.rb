class Lambroll < Formula
  version '0.8.1'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.8.1/lambroll_v0.8.1_darwin_amd64.zip"
  sha256 'd15ec593a74ce719cb8945b8f30f854e5b9c1cba67f4fbbb034559da8533b706'
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
