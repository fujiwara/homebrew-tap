class SopsSakuraKms < Formula
  version '0.0.5'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.5/sops-sakura-kms_v0.0.5_darwin_arm64.tar.gz'
      sha256 'f452f8cde03d9371bd498fedb71942c254b5d9577afdbf8ad183e7b4bc41fb37'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.5/sops-sakura-kms_v0.0.5_darwin_amd64.tar.gz'
      sha256 '4db8296ce196c5f4ce693c995971788f8e3bffb861afa7c9346d0506ad3270cd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.5/sops-sakura-kms_v0.0.5_linux_arm64.tar.gz'
      sha256 '6a5b96c1df0a293f16e199b3d29efa75448bde7f6d8371d030eda1cd9a22de1c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.5/sops-sakura-kms_v0.0.5_linux_amd64.tar.gz'
      sha256 '4d592ea6d6610788c62c27c86d02148c227785ee0c64e3563af44fd3c883b7c3'
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
