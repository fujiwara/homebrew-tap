class SopsSakuraKms < Formula
  version '0.7.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.7.0/sops-sakura-kms_v0.7.0_darwin_arm64.tar.gz'
      sha256 'cc47b2602392e338e18d1ec9c7c528ec7b0929e0cd567852755d95ad66fc655d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.7.0/sops-sakura-kms_v0.7.0_darwin_amd64.tar.gz'
      sha256 '0cec4ad143be58f1a15ff491d4a1c005490847ab4f0166939f6526f16b7a1edd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.7.0/sops-sakura-kms_v0.7.0_linux_arm64.tar.gz'
      sha256 'c6150ad7678dad114fc5d8022a67a53d98772f325a03465814a4f05f172f5370'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.7.0/sops-sakura-kms_v0.7.0_linux_amd64.tar.gz'
      sha256 'fe6587ec807b957e4df200ef7d564f1a0c21e0d42aa1ca380840e4080f86f968'
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
