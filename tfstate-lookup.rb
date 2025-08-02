class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.7.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.0/tfstate-lookup_1.7.0_darwin_arm64.tar.gz'
      sha256 '1faa01e048df39472c0c3d67d4b28c9f77e8a2efd3f7e12e45ae6a1fc716decb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.0/tfstate-lookup_1.7.0_darwin_amd64.tar.gz'
      sha256 '93bd4326482e068eecfa9c1436b4d763ad02928ed7c8cf7f9e6d5ce4ebb92f78'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.0/tfstate-lookup_1.7.0_linux_arm64.tar.gz'
      sha256 'a0a260230122ba5b2ae73a5c3d925485a084e9b6d49405eea6e8a9784e2451aa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.7.0/tfstate-lookup_1.7.0_linux_amd64.tar.gz'
      sha256 'c8060a86d09e5d79219037fba0b7aaa940442355d8c48e725d8600d1375dd3f8'
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
