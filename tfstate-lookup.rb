class TfstateLookup < Formula
  version '0.4.3'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.3/tfstate-lookup_0.4.3_darwin_amd64.tar.gz"
    sha256 'a8bb41de7c629ae843bc8668bd4fe82596b0e4b886a90ddd133ae978bae7a24c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.3/tfstate-lookup_0.4.3_linux_amd64.tar.gz"
    sha256 '5a2286fd93621bebac96d16e8c6496912acfca15d6c3816525d560ac175e8f69'
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
