class TfstateLookup < Formula
  version '0.0.11'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.11/tfstate-lookup_0.0.11_darwin_amd64.tar.gz"
  sha256 '5d604d648541cde95bdadc35a301f17cec62f04931050e0b096d8084ebed0176'
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
