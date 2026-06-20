class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.8.0'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.0/apprun-cli_v0.8.0_darwin_arm64.tar.gz'
      sha256 '0aae9deb0d128c4c70560022abea0d5cc92b87c770659f618bd85143bd4e7e9f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.0/apprun-cli_v0.8.0_darwin_amd64.tar.gz'
      sha256 'acbc56eed3ae501b37caadd5dc1d8703a6489dac653a03b600a336bd3b6f73c8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.0/apprun-cli_v0.8.0_linux_arm64.tar.gz'
      sha256 '74120baab2cc22d8da62b666addda2ece9fc8e21b11fb0e05ee4bcd47d663629'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.0/apprun-cli_v0.8.0_linux_amd64.tar.gz'
      sha256 '414ad23a4432c5f80714dd3b445f0ff50dd39c01b3d59078b8b3ae0a860b1d36'
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
