class SopsSakuraKms < Formula
  version '0.5.0'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.0/sops-sakura-kms_v0.5.0_darwin_arm64.tar.gz'
      sha256 'd56fc986997a581663311feea565ec33a69731dd067f32a92afed834d7e35b26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.0/sops-sakura-kms_v0.5.0_darwin_amd64.tar.gz'
      sha256 'b9d1d01853ac869b7c97a13fe92c5627a552a280b832d677a5f1405badca7ac1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.0/sops-sakura-kms_v0.5.0_linux_arm64.tar.gz'
      sha256 '93c09343288d865ed5fd1463d1a972db849348a1ba07a95e52b1014ddba844c7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.0/sops-sakura-kms_v0.5.0_linux_amd64.tar.gz'
      sha256 'f620fc83dcddb5e79662438d3fe054d7680e28efaebfa7f73767c7f9b5b84b86'
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
