class SimplemqCli < Formula
  version '0.2.1'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.1/simplemq-cli_v0.2.1_darwin_arm64.tar.gz'
      sha256 '344337a31b60531537fc48c6afdb1675afab87fd95b3a0fb42b68a39d2a28319'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.1/simplemq-cli_v0.2.1_darwin_amd64.tar.gz'
      sha256 '2d233bd2b67e72d2f7ec881b0dba2a773ee85daf36c5599233bdbdec7f11bd58'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.1/simplemq-cli_v0.2.1_linux_arm64.tar.gz'
      sha256 'f19023e621355305585cad5ff60b7a2e2d35949ae12e480b45e06d5fd9888b04'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.1/simplemq-cli_v0.2.1_linux_amd64.tar.gz'
      sha256 'dc52d0f2d5c9f760baedbd2d0b14cf0970f283579d8c31baa637b4b9ebcc9a05'
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
