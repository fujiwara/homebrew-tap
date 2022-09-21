class TfstateLookup < Formula
  version '1.0.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v1.0.0/tfstate-lookup_1.0.0_darwin_amd64.tar.gz"
    sha256 'a0ad8bc89c687f2789e06c557d676d59d4eaee184e01ae2e3551f9d04c378641'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v1.0.0/tfstate-lookup_1.0.0_linux_amd64.tar.gz"
    sha256 '11e4c371f77345e018641ccdfb9308d6d1e9ea81b8a9a715820ff7920f9189a0'
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
