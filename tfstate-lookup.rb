class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.4.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.1/tfstate-lookup_1.4.1_darwin_arm64.tar.gz'
      sha256 'db90fd9d947193d3747903c612c9e666d6044744099a5543b398cea7c0b848d6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.1/tfstate-lookup_1.4.1_darwin_amd64.tar.gz'
      sha256 'f270933544d1f6e04969c4895b4547c4562b34430560f589b637cdf166d4863c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.1/tfstate-lookup_1.4.1_linux_arm64.tar.gz'
      sha256 '86404ba6bdd3d70de184066aecc5e444de29cca516bce81a8f45ff4fbb9fd7f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.1/tfstate-lookup_1.4.1_linux_amd64.tar.gz'
      sha256 'b6fb93bec7a3785fc63b405c21b644fa952cbd43bb4247f2fb21b62c2e164469'
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
