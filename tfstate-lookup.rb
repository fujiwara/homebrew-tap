class TfstateLookup < Formula
  version '0.2.3'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.3/tfstate-lookup_0.2.3_darwin_amd64.tar.gz"
    sha256 '85b177b2bb5970a4f65968115298ac75d6b987bb49d59aaab4e7bd01c6b072ab'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.3/tfstate-lookup_0.2.3_linux_amd64.tar.gz"
    sha256 'bb3a88c3b0794b2cdf44c5506afaafb4c76e5ba3ee235a5f40a5cc3b8a28baed'
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
