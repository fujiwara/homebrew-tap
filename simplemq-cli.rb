class SimplemqCli < Formula
  version '0.2.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.0/simplemq-cli_v0.2.0_darwin_arm64.tar.gz'
      sha256 '413cfc95820f9abb4d3c755823b1fff6f0822fe360e8bc10dfd7e1a760383d88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.0/simplemq-cli_v0.2.0_darwin_amd64.tar.gz'
      sha256 'c53aa30da13939310f9d906ad5f94f5876ac75322f745fa91777c0676060421c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.0/simplemq-cli_v0.2.0_linux_arm64.tar.gz'
      sha256 '1372e27fe46ac63d4fd3a21e4b6d0fb96360f9b98d0f8d3ed2f83accdee4841b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.0/simplemq-cli_v0.2.0_linux_amd64.tar.gz'
      sha256 '430dcc71b1e29c36cd3117c197a8a78ad32d5fa243458c0eef96bf91698606bd'
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
