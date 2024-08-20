class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.5.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.5.1/ecsta_0.5.1_darwin_arm64.tar.gz'
      sha256 '6b9ce0779ee745573dbb4e0aa6b270ba9ab4b91bc6a72e9e527bf90d7ad9c76c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.5.1/ecsta_0.5.1_darwin_amd64.tar.gz'
      sha256 '6604a74f6d822e55d98519b2115dd1cd8621d49ba7d680a82f7e313b7ba24a21'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.5.1/ecsta_0.5.1_linux_arm64.tar.gz'
      sha256 '92432f7ec3e1ef9b33e60ec598523bf414ffb3abecd9051a96b62270e0f8abfa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.5.1/ecsta_0.5.1_linux_amd64.tar.gz'
      sha256 'b42cd78816ac8e37f748f67a26c9e8fa8b246c3df712834d33578dcb086dbe65'
    end
  end

  head do
    url 'https://github.com/fujiwara/ecsta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
