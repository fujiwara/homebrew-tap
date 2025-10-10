class SopsSakuraKms < Formula
  version '0.0.2'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.2/sops-sakura-kms_0.0.2_darwin_arm64.tar.gz'
      sha256 'a7c7d1e94a1117f76b6a1158457365223881b27393449add0b4a43a18f70bcdd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.2/sops-sakura-kms_0.0.2_darwin_amd64.tar.gz'
      sha256 '9da6a672adb8a8348fd4663491f51125cfed3e1fbd96b11c9a6a401e965416e8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.2/sops-sakura-kms_0.0.2_linux_arm64.tar.gz'
      sha256 '637afbbde14f360069dc5db70efcdbb40cf5511d14478b0378cce773514da81c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.2/sops-sakura-kms_0.0.2_linux_amd64.tar.gz'
      sha256 '8439d3a8de958cdc55a0459b0cdffb0041579f30cf6cb52fe2fe317a698d69d3'
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
