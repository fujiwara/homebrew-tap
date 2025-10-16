class SopsSakuraKms < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.4/sops-sakura-kms_v0.0.4_darwin_arm64.tar.gz'
      sha256 'b72b9ac7d54054ecfbd6f675be1bf8ece6749763ff03f0e0efc88c4dd6e559af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.4/sops-sakura-kms_v0.0.4_darwin_amd64.tar.gz'
      sha256 '9cdef228f9476d0c8ffd22bf7cd974da36b88b8bb7187cf1648f29caa1114f27'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.4/sops-sakura-kms_v0.0.4_linux_arm64.tar.gz'
      sha256 'abc347bb3ecd38f7549b805c0c7df3d96151cf3f86fae96dacbcfee98a516d6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.0.4/sops-sakura-kms_v0.0.4_linux_amd64.tar.gz'
      sha256 '5ca7b51df49bca999401af61a9301f8289c3096020916a9f4d9e6a4f0a3c8751'
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
