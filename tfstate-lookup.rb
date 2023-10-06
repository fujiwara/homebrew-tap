class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.4'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.4/tfstate-lookup_1.1.4_darwin_arm64.tar.gz'
      sha256 '32e06fcd5ab6a17ce2256f9a8636f6c2f8f9986e1f6c494d06061f03f72f9fed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.4/tfstate-lookup_1.1.4_darwin_amd64.tar.gz'
      sha256 '3ee3c2ab38074d0df44fdbe075a178ab31c0101412d0f61c4f624881ccbec1fc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.4/tfstate-lookup_1.1.4_linux_arm64.tar.gz'
      sha256 '4b2e1a428e68bce6aeafc72951f683d537a617f5fe88f06e8ab10ce92369bbb4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.4/tfstate-lookup_1.1.4_linux_amd64.tar.gz'
      sha256 'f9c118a15ef7c76ef2580be719dacb842b6bb3e020d174ac7cb41db0bc90792e'
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
