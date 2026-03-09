class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.7.0'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.7.0/apprun-cli_v0.7.0_darwin_arm64.tar.gz'
      sha256 '8b55a8ce725ccf20dfac802e12ea50a3ddb1eee9144f53b6591e1db533488672'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.7.0/apprun-cli_v0.7.0_darwin_amd64.tar.gz'
      sha256 'a5aa42ccdd87aefa81d8e705d5b245536c3da4c8916cb22c38c4f20479e7619a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.7.0/apprun-cli_v0.7.0_linux_arm64.tar.gz'
      sha256 '092b312d3b6f0a3602177f59aea632001af5976b0fe0e5353f933795751c8b7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.7.0/apprun-cli_v0.7.0_linux_amd64.tar.gz'
      sha256 'bbb3f37ea9326161267654cdbe4e361ec281381059a263b9b1f7141f82083521'
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
