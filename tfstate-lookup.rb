class TfstateLookup < Formula
  version '0.0.12'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.12/tfstate-lookup_0.0.12_darwin_amd64.tar.gz"
  sha256 'c7ea5ba671d9f7cb183df014a93e55a95a5c982f1322d1420e4122d32aad510a'
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
