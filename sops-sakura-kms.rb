class SopsSakuraKms < Formula
  version '0.3.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.3.0/sops-sakura-kms_v0.3.0_darwin_arm64.tar.gz'
      sha256 'fb072a972c6efe1923603e4cb5b762bab768969764d6c74a31360403b35fac9c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.3.0/sops-sakura-kms_v0.3.0_darwin_amd64.tar.gz'
      sha256 '74b3325f104f7298b84f173b3917c010f00d7bcf0a8750c8c5b0f150bde2964d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.3.0/sops-sakura-kms_v0.3.0_linux_arm64.tar.gz'
      sha256 'a66b21d4591e70e3d315e3989cb38e5026b70413fa7ad43343ef04521cabf009'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.3.0/sops-sakura-kms_v0.3.0_linux_amd64.tar.gz'
      sha256 '9b477af1d6eed8da944f583eb50889ccb08c9026e07f42fa0a260ee6fb3b4893'
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
