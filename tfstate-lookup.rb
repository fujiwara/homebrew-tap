class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.5'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.5/tfstate-lookup_1.1.5_darwin_arm64.tar.gz'
      sha256 'c7bdd9bf8cd66a4ec726f9ffcb7243f818f5df9af40b32e2c1a2e895599f0a5d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.5/tfstate-lookup_1.1.5_darwin_amd64.tar.gz'
      sha256 'f26e0cfc30d0a1445635f61ebb10bf34782bf8977accd8a4d246b239523ef7ff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.5/tfstate-lookup_1.1.5_linux_arm64.tar.gz'
      sha256 '46898ea6a58bf5b67de76058979d93dd96d75a9379e5b325682a91a6c774825e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.5/tfstate-lookup_1.1.5_linux_amd64.tar.gz'
      sha256 '5f83389f6461aa4699c85f7d404efc135a29664139d2c7d30db8d2f530afdd8d'
    end
  end

  head do
    url 'https://github.com/fujiwara/tfstate-lookup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
