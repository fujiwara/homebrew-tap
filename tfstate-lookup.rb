class TfstateLookup < Formula
  version '0.0.10'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.10/tfstate-lookup_0.0.10_darwin_amd64.tar.gz"
  sha256 'cf6edd26ed3a8b245a9ec8e30beb632983c0b06f8d18667b16b04e833236d4db'
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
