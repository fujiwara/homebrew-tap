class SopsSakuraKms < Formula
  version '0.2.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.2.0/sops-sakura-kms_v0.2.0_darwin_arm64.tar.gz'
      sha256 '4a2a15a5c416f01caea1dcbb3d72c06ac6f057f5ee7821ee71b440f974a16422'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.2.0/sops-sakura-kms_v0.2.0_darwin_amd64.tar.gz'
      sha256 'acf393642eea48b686ed8b655551ab7434ea7a264bc71d5437f7e870eaa2ca48'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.2.0/sops-sakura-kms_v0.2.0_linux_arm64.tar.gz'
      sha256 '4b126a84b6feedacdc31b32f4d2cb5642e4c8d55a4091e59c28427472e200e45'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.2.0/sops-sakura-kms_v0.2.0_linux_amd64.tar.gz'
      sha256 'b70f9f11b6873cf47bf0c7a94ba585cf7079aa3b9fe2a7685ff7153dd5289324'
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
