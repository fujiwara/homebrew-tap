class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.8.1'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.1/apprun-cli_v0.8.1_darwin_arm64.tar.gz'
      sha256 'be9e8bde1bf466456e57103dc5613c487fc32ad4390427d98e86b61bae7cf831'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.1/apprun-cli_v0.8.1_darwin_amd64.tar.gz'
      sha256 'c4def15d66b6db113bade40b235e6e27a7ef515f7d3efcd22c454858a40ae7eb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.1/apprun-cli_v0.8.1_linux_arm64.tar.gz'
      sha256 'e717c7eeae0e7db50dc8006e74dc62338b3468c4ca780c6ab1c744cbde9a65f1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.8.1/apprun-cli_v0.8.1_linux_amd64.tar.gz'
      sha256 'c97b3dbdbe5157144e27b1488176017425441e31c681362251671ae654c67992'
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
