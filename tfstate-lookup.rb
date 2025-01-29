class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.4.3'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.3/tfstate-lookup_1.4.3_darwin_arm64.tar.gz'
      sha256 '6c1ea0b9d76929dcf0b5058d9284c0bff33d1b076e205f5f485c522a0c045ae2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.3/tfstate-lookup_1.4.3_darwin_amd64.tar.gz'
      sha256 '387871ee5c23a5eaa29398f4f0c86f62a49f86bde4492cc34eb2dc66a81a2415'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.3/tfstate-lookup_1.4.3_linux_arm64.tar.gz'
      sha256 '0de49ea4d5a90d6069c44c9459ff3adc44271812ffe8ad3a0b9119fd2c362de3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.3/tfstate-lookup_1.4.3_linux_amd64.tar.gz'
      sha256 'f141ce084d90b7b117cfdcbed6530758d89c17ad08facaa941fbf6c16c6376d4'
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
