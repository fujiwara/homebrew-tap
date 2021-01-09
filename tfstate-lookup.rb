class TfstateLookup < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.0/tfstate-lookup_0.1.0_darwin_amd64.tar.gz"
    sha256 'b6eb59fca56dd7abc17fbe6d8286665fd6f0288c5d53de591ac266fb74331e98'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.0/tfstate-lookup_0.1.0_linux_amd64.tar.gz"
    sha256 'c72aacb48067411739c06578a42e8562577474be21548cd956d29d69be33bc2a'
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
