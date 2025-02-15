class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.2.3'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.2.3/apprun-cli_0.2.3_darwin_arm64.tar.gz'
      sha256 '96ca719fd17eea09afc760ccff6a8c3591bbb752221ad22993622ea148faf08a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.2.3/apprun-cli_0.2.3_darwin_amd64.tar.gz'
      sha256 'b766cd74c4bc24f5717338d999f919a8472428e2b6eb61f7d4e7b383a8d633f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.2.3/apprun-cli_0.2.3_linux_arm64.tar.gz'
      sha256 'f8de3fa4b903dfebc1bde812edbd86a45b64df80b7610b26cbe8ab8686ac39cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.2.3/apprun-cli_0.2.3_linux_amd64.tar.gz'
      sha256 '9e926190bfebe4fd3856d35367521ae6b2fa20929b2edc8d007d5518cdb704de'
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
