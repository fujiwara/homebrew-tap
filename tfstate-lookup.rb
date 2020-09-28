class TfstateLookup < Formula
  version '0.0.13'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.13/tfstate-lookup_0.0.13_darwin_amd64.tar.gz"
    sha256 'ab345238f22087ed7cd42723b122a7d80a10fa6c00753a0c9678d6dee401e825'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.13/tfstate-lookup_0.0.13_linux_amd64.tar.gz"
    sha256 '319ff26ea76da8a85963ccf55ec1d72251a7286d28aa9424ac35fbe3d8bad76a'
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
