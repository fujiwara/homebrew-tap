class SopsSakuraKms < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.4.0/sops-sakura-kms_v0.4.0_darwin_arm64.tar.gz'
      sha256 'c5b738e36fb88a80129ffd6acd3c9fc94ed9a625ff3f0996a1b07c9eae05a7a5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.4.0/sops-sakura-kms_v0.4.0_darwin_amd64.tar.gz'
      sha256 '95ca17c04e821bf1aca9cbe98616d56115f6efc8a352bd43189789ab53a84ddd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.4.0/sops-sakura-kms_v0.4.0_linux_arm64.tar.gz'
      sha256 'f691ffad37aa0a1c322bd2a1d0e561b97c605c066e8ad35c106855ab7bae5444'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.4.0/sops-sakura-kms_v0.4.0_linux_amd64.tar.gz'
      sha256 '51dcd094dc13080f86e45d35e8c2f5d8f589531f35f2ea1de2f7465f879da652'
    end
  end

  head do
    url 'https://github.com/fujiwara/sops-sakura-kms.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'sops-sakura-kms'
  end
end
