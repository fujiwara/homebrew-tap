class TfstateLookup < Formula
  version '0.2.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.2/tfstate-lookup_0.2.2_darwin_amd64.tar.gz"
    sha256 '6982c06bcc3c49e468137305271b7c62da3bb65722446c03ef04a5847586089a'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.2/tfstate-lookup_0.2.2_linux_amd64.tar.gz"
    sha256 'a71956ab1d7d3298e54863c789af4c5cbe6e205bd47822995be9d1dab65db93d'
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
