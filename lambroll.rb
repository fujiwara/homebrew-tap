class Lambroll < Formula
  version '0.3.2'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.3.2/lambroll_v0.3.2_darwin_amd64.zip"
  sha256 '63c3cc9acdf54aaeb5939a4c0bd01240b7f9fa27c23a5920d4592018de8cf4e4'
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
