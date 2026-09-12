class SopsSakuraKms < Formula
  version '0.6.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.6.0/sops-sakura-kms_v0.6.0_darwin_arm64.tar.gz'
      sha256 'e81826050e182e5fd514e1744480644d56e3fd46b368f444cd911c4785dcef61'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.6.0/sops-sakura-kms_v0.6.0_darwin_amd64.tar.gz'
      sha256 '91ca434b7a5b9ecee18311e700ae877e3a113329a7c40d49f04124cf225c1ca1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.6.0/sops-sakura-kms_v0.6.0_linux_arm64.tar.gz'
      sha256 '552370e6a468330390d31efd4ad495e73335b0ed261ba713fc12838862a72b71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.6.0/sops-sakura-kms_v0.6.0_linux_amd64.tar.gz'
      sha256 '226fd98af6b1f9b4ac285eb334c3083d06931e66dc158b3d204aa1a894514ae2'
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
