class TfstateLookup < Formula
  version '0.0.8'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.8/tfstate-lookup_0.0.8_darwin_amd64.tar.gz"
  sha256 'ca8a8a56b1aaa63ebd9f8c38d387f58f73ed0dba0b2d2e58e8940e90c6636e11'
  head 'https://github.com/fujiwara/tfstate-lookup.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
