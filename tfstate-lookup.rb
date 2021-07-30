class TfstateLookup < Formula
  version '0.2.4'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.4/tfstate-lookup_0.2.4_darwin_amd64.tar.gz"
    sha256 'dcf67b327bc086fd4b6f295dc5119b2d6324ae2eb320db652268f6d471bffd97'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.4/tfstate-lookup_0.2.4_linux_amd64.tar.gz"
    sha256 '57a088719c69f062d4e77b90f64847eff3941a0ed04b32cf3e054fcaf27c87bc'
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
