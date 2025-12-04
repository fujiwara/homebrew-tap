class SimplemqCli < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.1.0/simplemq-cli_v0.1.0_darwin_arm64.tar.gz'
      sha256 '3de4a14e9b32a871bec2c38039dfaf2f57c58146a1038fd3f0a49c7f1f94a1a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.1.0/simplemq-cli_v0.1.0_darwin_amd64.tar.gz'
      sha256 'fd7449bcac835640bef41317f964c6fc734d769a9aad04e5b193917991af502e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.1.0/simplemq-cli_v0.1.0_linux_arm64.tar.gz'
      sha256 '44e976b81075f8ddffa04779db8c5afbdc2600c0639cbbf0977edf749a246a06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.1.0/simplemq-cli_v0.1.0_linux_amd64.tar.gz'
      sha256 '4e346cd05e050476645879f5a8b3db116e33852e79db6a108659e995fc06a91c'
    end
  end

  head do
    url 'https://github.com/fujiwara/simplemq-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'simplemq-cli'
  end
end
