class SopsSakuraKms < Formula
  version '0.0.1'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.1/sops-sakura-kms_0.0.1_darwin_arm64.tar.gz'
      sha256 'b9a95857572d442d36ec17d685cbd7c03d2af9dce38e6084e093404dbaa30061'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.1/sops-sakura-kms_0.0.1_darwin_amd64.tar.gz'
      sha256 '2f3f2ed9f50111fa27a6040ec7213786b685374aeaa5521a2680a35a828cad64'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.1/sops-sakura-kms_0.0.1_linux_arm64.tar.gz'
      sha256 'f0bb765b15b8537601bc30c2ea5c86d31ca52f9ac069e79b081b1808b4846e50'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.1/sops-sakura-kms_0.0.1_linux_amd64.tar.gz'
      sha256 'c254d83134b25d8fddacd178367a8c9a403dadf04b55d8b9e848cec2cb683d9f'
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
