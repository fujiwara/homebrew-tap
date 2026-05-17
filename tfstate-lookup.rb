class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.12.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.1/tfstate-lookup_1.12.1_darwin_arm64.tar.gz'
      sha256 '786b7e8ad350d59bd9240ecade6085bbd872b288172245495dd0c31cc8bfa689'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.1/tfstate-lookup_1.12.1_darwin_amd64.tar.gz'
      sha256 '2655ea8c461bc49c4092209999453923c96caa782b39bb46ccc8776d18c94115'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.1/tfstate-lookup_1.12.1_linux_arm64.tar.gz'
      sha256 'f5bb2464e90d4ee9fea2ce91b2c6984b66eda458e0ed6ecbe33f51975b6baf16'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.1/tfstate-lookup_1.12.1_linux_amd64.tar.gz'
      sha256 'c69c10cbe2b075a5a7451c6e093d29403cd67ff034131073ed74a1c74c6e55ad'
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
