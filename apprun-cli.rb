class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.9.0'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.9.0/apprun-cli_v0.9.0_darwin_arm64.tar.gz'
      sha256 '01b1e0f5a53fda549ca249849b27e6201c9a7f8e6625314101a70112dd1875c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.9.0/apprun-cli_v0.9.0_darwin_amd64.tar.gz'
      sha256 '4b3e46ab1a850c586e7afe67b606cb67b60a0c3ae3f47e3977c4412a2267e18d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.9.0/apprun-cli_v0.9.0_linux_arm64.tar.gz'
      sha256 '957c73add8a176042ca71d8f11c448fb694b7d2d61e2e9bd8002ec6d7fa66ced'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.9.0/apprun-cli_v0.9.0_linux_amd64.tar.gz'
      sha256 'ccbf5594aef863e958f6c86f92ea769482372a85f8b1d2bd2699a4deec75a61f'
    end
  end

  head do
    url 'https://github.com/fujiwara/apprun-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'apprun-cli'
  end
end
