class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.3.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.2/tfstate-lookup_1.3.2_darwin_arm64.tar.gz'
      sha256 'fbbfcdffe49ac0dc794aaea680561ae625b252ba73854e642eb394c6b66c9bbc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.2/tfstate-lookup_1.3.2_darwin_amd64.tar.gz'
      sha256 '16a74ccd072b18baeb6e4f14981f6163fa0dfe4d3611d669c585c1c8fc727a70'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.2/tfstate-lookup_1.3.2_linux_arm64.tar.gz'
      sha256 '05c6b42c8ccbf80c175732e912ded637b358f5d19aecc5bbde1b14ba26a2254f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.2/tfstate-lookup_1.3.2_linux_amd64.tar.gz'
      sha256 '5ec8d8c02c6b11206326bc3f88f8649d249010410a480fda56f07eb40af82d4c'
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
