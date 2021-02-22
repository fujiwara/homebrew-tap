class TfstateLookup < Formula
  version '0.1.3'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.3/tfstate-lookup_0.1.3_darwin_amd64.tar.gz"
    sha256 '3e76eff789534c6950994cb847aa9e775f083d2cc06f73b6b1a131108b8ecba3'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.3/tfstate-lookup_0.1.3_linux_amd64.tar.gz"
    sha256 '30ca40e7baff1a3be26a5f34e9445b4d95259b1eac5c924cf2a4bc3502cc32db'
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
