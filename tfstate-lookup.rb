class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.7.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.1/tfstate-lookup_1.7.1_darwin_arm64.tar.gz'
      sha256 '62bd7385a3e52c1e2acace914943caa9ac9df78a20dcede9f194b23521a458eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.1/tfstate-lookup_1.7.1_darwin_amd64.tar.gz'
      sha256 'f8069e5a206f5e217bd6e5a9740b4f658f4c491c93dac898a9ed4701f1a5daaf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.1/tfstate-lookup_1.7.1_linux_arm64.tar.gz'
      sha256 'b0d133eed074eb35cd95cbb71604fbfe4d41ea7fba1c2c54ed4e36eb47441ac6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.1/tfstate-lookup_1.7.1_linux_amd64.tar.gz'
      sha256 '8236e7c7160fabfa5346a4589aa0b932246e6d2dd12a6151c465fa42f9814f73'
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
