class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.0.2'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.2/apprun-cli_0.0.2_darwin_arm64.tar.gz'
      sha256 'c384dd8be097ca19bf9c1b3b8c81f8a07fe8e7d2eb82d1071ad6b3f9b94c17e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.2/apprun-cli_0.0.2_darwin_amd64.tar.gz'
      sha256 'c74c8c65dd530e11aa0abcc2800c9e06d46f74be8d5ab5d051fdf251ee52e9c7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.2/apprun-cli_0.0.2_linux_arm64.tar.gz'
      sha256 'd5b020ed4153dcb0277103a9fcae21d6c04bb14be1c1268ce6cf5768514c7113'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.2/apprun-cli_0.0.2_linux_amd64.tar.gz'
      sha256 '5bdeb955da26accb298ea7fecf2674445abbd84c3f582234944ed0945fbe7c80'
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
