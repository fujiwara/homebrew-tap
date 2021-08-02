class TfstateLookup < Formula
  version '0.3.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.3.0/tfstate-lookup_0.3.0_darwin_amd64.tar.gz"
    sha256 '4a1b9a8f5e10bbf5e6170e528e4e92389d4570144433c99c2be0b63a32d792f5'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.3.0/tfstate-lookup_0.3.0_linux_amd64.tar.gz"
    sha256 'c81c2b6fc9d973382a8df52f1b9118552375810e644c4bd45f03933d847c1ebe'
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
