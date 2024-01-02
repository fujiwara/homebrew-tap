class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.6'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.6/tfstate-lookup_1.1.6_darwin_arm64.tar.gz'
      sha256 'e1d7fe3562bd8b894438e22d43ed2e846c5ff4405f7e4e1d9277c33dc30bd36a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.6/tfstate-lookup_1.1.6_darwin_amd64.tar.gz'
      sha256 '1e27a567de6b24dc9291b003078cd209efbf5efdff993899a65fc7f7f0f256fa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.6/tfstate-lookup_1.1.6_linux_arm64.tar.gz'
      sha256 '3e9588315c49664d1689e79f2368ea8ec34672b1496af0643881b6173c8069d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.6/tfstate-lookup_1.1.6_linux_amd64.tar.gz'
      sha256 'bcaae9faf897ac168a232246ef10210316a1499e127a1d520f6b68f9a330ba33'
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
