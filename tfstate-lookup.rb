class TfstateLookup < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.0/tfstate-lookup_0.4.0_darwin_amd64.tar.gz"
    sha256 'd6433cf69d514a24f4394ccf4b39d2441b42179cdf5ea7ad792b8ddc41c9cef4'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.0/tfstate-lookup_0.4.0_linux_amd64.tar.gz"
    sha256 '31b970e6182daf93907fe0bb7d9c8c652351d9f3f9244b81efcd66e5ce500c65'
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
