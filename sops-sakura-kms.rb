class SopsSakuraKms < Formula
  version '0.5.1'
  homepage 'https://github.com/fujiwara/sops-sakura-kms'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.1/sops-sakura-kms_v0.5.1_darwin_arm64.tar.gz'
      sha256 '5412cd543ac903948a8036e197e3d3cc2ad0b981c23aad456b7c6082fc42ea3b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.1/sops-sakura-kms_v0.5.1_darwin_amd64.tar.gz'
      sha256 'f4c6ddb82ea1092a743a44e7d54349bb007c4a22c5655dafbb0029f5012e3240'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.1/sops-sakura-kms_v0.5.1_linux_arm64.tar.gz'
      sha256 'f9b2e7f5d7b38c2ceaa683826dc3e66b34d06ffe2fac0e46dcf748ffbd046792'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sops-sakura-kms/releases/download/v0.5.1/sops-sakura-kms_v0.5.1_linux_amd64.tar.gz'
      sha256 '55a864817c72fae45caf2133150f9da4cd204094d94299f87b57d183c3b969b3'
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
