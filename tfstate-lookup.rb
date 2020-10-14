class TfstateLookup < Formula
  version '0.0.14'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.14/tfstate-lookup_0.0.14_darwin_amd64.tar.gz"
    sha256 'd8bba721da10bdd583dcf5940b3a68f3a65029a63caafa59468ecd6170f3c4a0'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.14/tfstate-lookup_0.0.14_linux_amd64.tar.gz"
    sha256 '9350f87bddca49112637f74463cdbea49070c1786aaab988e3084329b61c42af'
  end
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
