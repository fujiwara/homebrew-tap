class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.2/tfstate-lookup_1.1.2_darwin_arm64.tar.gz'
      sha256 '0a40b03db8d9fcc990527c8993918dfd0c3af12fbde98f949b8baead01f55df8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.2/tfstate-lookup_1.1.2_darwin_amd64.tar.gz'
      sha256 '540cf0d40a749e506f420ba31612882a9dd1a71040a19f7375a8792b7db1c232'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.2/tfstate-lookup_1.1.2_linux_arm64.tar.gz'
      sha256 '2a89552a0b02c2c7460372b6915d5c35c11a5ad21415bcbc365d232859284a1e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.2/tfstate-lookup_1.1.2_linux_amd64.tar.gz'
      sha256 'eca7435e182a49cd6a9c0eacf475f97bf12402000351871507baa76936650cb9'
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
