class ApprunDedicatedCli < Formula
  desc 'A deploy tool for Sakura Cloud AppRun Dedicated(共有型).'
  version '0.1.2'
  homepage 'https://github.com/fujiwara/apprun-dedicated-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.2/apprun-dedicated-cli_v0.1.2_darwin_arm64.tar.gz'
      sha256 'c954b28eb4b3d65d9b678f6ff85b632440f0b6a6e37aab0e1ca6c19a04544bff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.2/apprun-dedicated-cli_v0.1.2_darwin_amd64.tar.gz'
      sha256 '7e7c1c5d0107aa642dccdd09fbc425fd68d8a67f2403ec0d08101c7c450cff0c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.2/apprun-dedicated-cli_v0.1.2_linux_arm64.tar.gz'
      sha256 '27de32e5ec9a77d21b567ece309c5a5aef24cc96c5bee3475c3643431a495d17'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.2/apprun-dedicated-cli_v0.1.2_linux_amd64.tar.gz'
      sha256 '4a8a25a574693c73a5c5fcba2909f92ff093dedc5e4eaf2321fa3d44d6305350'
    end
  end

  head do
    url 'https://github.com/fujiwara/apprun-dedicated-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'apprun-dedicated-cli'
  end

  test do
    system "#{bin}/apprun-dedicated-cli", '-h'
  end
end
