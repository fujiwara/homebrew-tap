class Lambroll < Formula
  version '0.1.1'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.1.1/lambroll_v0.1.1_darwin_amd64.zip"
  sha256 'b291d63d54e24b0823bb44e2a8d6c1a3ccdb6654f537043ed2e419a360da5bae'
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
