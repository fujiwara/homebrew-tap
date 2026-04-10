class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.8.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.1/ecsta_0.8.1_darwin_arm64.tar.gz'
      sha256 'e2f54a71bf9fa71b7d50deb58ffb538853116f0012d9001a3920dff0dfd3d9bd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.1/ecsta_0.8.1_darwin_amd64.tar.gz'
      sha256 '6b63ba180e30652948e72e22fcc24161d6e93138b6da2198d67d752ff21e07b7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.1/ecsta_0.8.1_linux_arm64.tar.gz'
      sha256 'f1bacb65987c99491d448c2dda0daa5ca3ef87f5949566d2eaeb4350d2a4f61c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.1/ecsta_0.8.1_linux_amd64.tar.gz'
      sha256 'f88642d9957379b448eed75e70a20fb2c95acf15132ecea9b0226801953c756d'
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
