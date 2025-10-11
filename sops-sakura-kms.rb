class SopsSakuraKms < Formula
  version '0.0.3'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.3/sops-sakura-kms_0.0.3_darwin_arm64.tar.gz'
      sha256 '25f7c241128995cc1e783a54ed78ab047c8bf8c9aa7257decea0da31713a2115'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.3/sops-sakura-kms_0.0.3_darwin_amd64.tar.gz'
      sha256 'd44ae149c380cfa97bf1b5d3f26daea6a8342650a4117a4fc6bce6b6eadd6ffb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.3/sops-sakura-kms_0.0.3_linux_arm64.tar.gz'
      sha256 'd8932cc3fac681a3970771caf4d56b18a7b49ac91ac0e5c7f227028aa5031117'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.3/sops-sakura-kms_0.0.3_linux_amd64.tar.gz'
      sha256 '870088d40f5b2cb65c231011bb9ca9b2a3a574cb3c5af5988199ee470e449fa0'
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
