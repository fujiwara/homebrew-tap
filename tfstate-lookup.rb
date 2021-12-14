class TfstateLookup < Formula
  version '0.4.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.2/tfstate-lookup_0.4.2_darwin_amd64.tar.gz"
    sha256 '45b8ab76896a68c406b0bf1db7eb0b24e16986b676258d614986eb36b5818954'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.2/tfstate-lookup_0.4.2_linux_amd64.tar.gz"
    sha256 'b5f642f4bef730120afc410086057041e9fc831f6bfc0d5ecaa000d3cfbcb487'
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
