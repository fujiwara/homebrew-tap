class TfstateLookup < Formula
  version '0.4.4'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.4/tfstate-lookup_0.4.4_darwin_amd64.tar.gz"
    sha256 '8f964d6f15276e48f8c00021f7291be0aa22800f5e67478dfe024c0b932af8ac'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.4/tfstate-lookup_0.4.4_linux_amd64.tar.gz"
    sha256 'a07d3ce73bcf18df711353c40e9e936c9673f7b90017564dcf4a9c8d95861b5c'
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
