class ApprunDedicatedCli < Formula
  desc 'A deploy tool for Sakura Cloud AppRun Dedicated(共有型).'
  version '0.0.1'
  homepage 'https://github.com/fujiwara/apprun-dedicated-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.0.1/apprun-dedicated-cli_v0.0.1_darwin_arm64.tar.gz'
      sha256 '853f35b4aeeb4d059f94df78b3303e7182d259f419dae859af1624ffcd9548a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.0.1/apprun-dedicated-cli_v0.0.1_darwin_amd64.tar.gz'
      sha256 'e1486adf88d0c101d276f480b9e3db73ace9cbfbb14bc2083f9e11dc5480062e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.0.1/apprun-dedicated-cli_v0.0.1_linux_arm64.tar.gz'
      sha256 'cf80d97df3bb0171b663dbe773d17a1084a2580eee709073c005fb29ee19867a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-dedicated-cli/releases/download/v0.0.1/apprun-dedicated-cli_v0.0.1_linux_amd64.tar.gz'
      sha256 '672a100e1ab5acc488d474f9ed782b932c6895a39db95fc3465abf464dedc25d'
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
