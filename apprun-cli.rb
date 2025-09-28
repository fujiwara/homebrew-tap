class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.5.1'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.1/apprun-cli_v0.5.1_darwin_arm64.tar.gz'
      sha256 'c426c0681f54f9fdf6ae92ccce4ec438559ba9dc46ceff6f55da2d18278bdf5c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.1/apprun-cli_v0.5.1_darwin_amd64.tar.gz'
      sha256 '65895557b511c1d3487653f89ce5059e2fb010289809be6fa3d75dce47a203c9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.1/apprun-cli_v0.5.1_linux_arm64.tar.gz'
      sha256 '17572a8bd1bb6b441a6aef906b0cd2a761927f28963cad75bf8f5968210294e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.1/apprun-cli_v0.5.1_linux_amd64.tar.gz'
      sha256 'c49c9c5b0007d6fe9bdb93fd974b1c7395e503320b86561938aae39220052c98'
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
