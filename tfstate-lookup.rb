class TfstateLookup < Formula
  version '0.1.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.2/tfstate-lookup_0.1.2_darwin_amd64.tar.gz"
    sha256 'b199227405de6e8ceda626c2efb8d8ba31eb356cdf2dc06dc2476681067229c8'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.2/tfstate-lookup_0.1.2_linux_amd64.tar.gz"
    sha256 'fab867488335b45fc972e35d0e9004eb76977695c3010b224222b07ea746bd02'
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
