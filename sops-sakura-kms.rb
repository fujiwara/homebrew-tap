class SopsSakuraKms < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.1.0/sops-sakura-kms_v0.1.0_darwin_arm64.tar.gz'
      sha256 'dd2a9588f051771559fe5684b82a20aa41afd55b704646140f5f7b12af63f0c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.1.0/sops-sakura-kms_v0.1.0_darwin_amd64.tar.gz'
      sha256 '9d32365f7581f4a77b2e25ddb8a30b8a7038e2a395b983ef69e93dcddf896e99'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.1.0/sops-sakura-kms_v0.1.0_linux_arm64.tar.gz'
      sha256 '493f2f4a5e16aae3fe0a01b47a1bbdda04585b1df88f8690f58228d4a60adf2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.1.0/sops-sakura-kms_v0.1.0_linux_amd64.tar.gz'
      sha256 'ba8a88b1a939eb6dbc6ccf80fd5ad0bfaacff33e4ab147b8deca0fbc718f281f'
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
