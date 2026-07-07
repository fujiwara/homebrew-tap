class ApprunDedicatedCli < Formula
  desc 'A deploy tool for Sakura Cloud AppRun Dedicated(共有型).'
  version '0.1.1'
  homepage 'https://github.com/fujiwara/apprun-dedicated-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.1/apprun-dedicated-cli_v0.1.1_darwin_arm64.tar.gz'
      sha256 '13f67bb12bf10cbe29b24b52d44a4120c6a940db57b1966eaf2fb2167fc040ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.1/apprun-dedicated-cli_v0.1.1_darwin_amd64.tar.gz'
      sha256 'f37ac73f9c9bab69b81e9bda4c606d75ba5af80a07525cb9a319eb04747a6090'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.1/apprun-dedicated-cli_v0.1.1_linux_arm64.tar.gz'
      sha256 '054cb1e1befb96fcb8a78c94f72834ed42e313c5d1cf4daa5b6c9c14132b8eee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.1/apprun-dedicated-cli_v0.1.1_linux_amd64.tar.gz'
      sha256 'e9d1ea198866d6366c3a0b28ed13310679f311cfce3414f14d38a954b1ac56e8'
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
