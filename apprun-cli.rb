class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.5.0'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.0/apprun-cli_v0.5.0_darwin_arm64.tar.gz'
      sha256 'fecf612d903324fa1eef559415bb110e0a4f5dea0415ca768f0b8c9ff8a73992'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.0/apprun-cli_v0.5.0_darwin_amd64.tar.gz'
      sha256 '2549fbc43b5fe9ddd9c3e1149221f61e3095bf1501b955cbc681377715a7958c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.0/apprun-cli_v0.5.0_linux_arm64.tar.gz'
      sha256 '1542094ee935d813e0a0ef6df457d747a4d5a8f358fc87cc6646f6a4e05360ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.0/apprun-cli_v0.5.0_linux_amd64.tar.gz'
      sha256 '86fa0fad36ded186828f35e3c4a77086a54034aa3eee954fd5f9a82abfb39edd'
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
