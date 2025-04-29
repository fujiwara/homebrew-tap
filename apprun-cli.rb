class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.3.2'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.3.2/apprun-cli_v0.3.2_darwin_arm64.tar.gz'
      sha256 'f5f07c6593cb13dac2869da786567d0acbde773d1b5e7b13c12c566cfd740ac5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.3.2/apprun-cli_v0.3.2_darwin_amd64.tar.gz'
      sha256 'a6e1e3f7cd6d771d54d78d841cac5d9a7e767f8c01c75a6cfb38b66762df0a3a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.3.2/apprun-cli_v0.3.2_linux_arm64.tar.gz'
      sha256 '8be656fa732bea2b938f3261e29ac3255e45bb3dce3802eb7e383f72ece46a6d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.3.2/apprun-cli_v0.3.2_linux_amd64.tar.gz'
      sha256 'f9972b5ac213d9068a3b4eb352c9704cadb9deff42f0fba76d72bb8adea98c05'
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
