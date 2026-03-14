class ApprunDedicatedCli < Formula
  desc 'A deploy tool for Sakura Cloud AppRun Dedicated(共有型).'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/apprun-dedicated-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.0/apprun-dedicated-cli_v0.1.0_darwin_arm64.tar.gz'
      sha256 '9dc56cd801e5dd8f35101210b351dbc2b1198e09d57e825f2b83a6a9e09c9cc6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.0/apprun-dedicated-cli_v0.1.0_darwin_amd64.tar.gz'
      sha256 'a074a11cdf20a90c7183beff074f2e95ed2877f6141e37a25106426a72fbd5f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.0/apprun-dedicated-cli_v0.1.0_linux_arm64.tar.gz'
      sha256 '7e60eb697525e9e429780bf2dfb29030e16e352ab233749d076aa8484c8a2d99'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.1.0/apprun-dedicated-cli_v0.1.0_linux_amd64.tar.gz'
      sha256 'f250303af270dbb173daa270e8eb119adda0dfa16360c1464d6c364d999ec349'
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
