class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.12.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.2/tfstate-lookup_1.12.2_darwin_arm64.tar.gz'
      sha256 'c2c61d3cbb9bb141726b13a3b4567a164ce9c6ebc8cd3f10242799385cc67c4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.2/tfstate-lookup_1.12.2_darwin_amd64.tar.gz'
      sha256 '3cb0fe3968561b80fa201c2316bffa0bbf36597e2b373628de84eaf4ba277085'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.2/tfstate-lookup_1.12.2_linux_arm64.tar.gz'
      sha256 '0e6df8a7ae28cabc0e4db1be4e4365f4c43c1a627ecfbd28a36ece37c42af9d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.2/tfstate-lookup_1.12.2_linux_amd64.tar.gz'
      sha256 'e17985dbb75ee82c46670026ad4dd6485d286b34e3fc235427b666f49a1fa68a'
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
