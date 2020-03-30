class TfstateLookup < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.0.4/tfstate-lookup_0.0.4_darwin_amd64.tar.gz"
  sha256 'e22d25d0360505c49923ec828744e8fc0d99b8576bc43787fd3f93d109d01758'
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
