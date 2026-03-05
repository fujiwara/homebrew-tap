class SimplemqCli < Formula
  version '0.5.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.5.0/simplemq-cli_0.5.0_darwin_arm64.tar.gz'
      sha256 'cb3159348fb9a7cdff675a2ea1693eed6f1b22b99be0bad797c6d4c22c32eab4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.5.0/simplemq-cli_0.5.0_darwin_amd64.tar.gz'
      sha256 '7b333ba963d18ea7906c260f9599f71fd7e618aa3008d87f4b9920f8d7a136f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.5.0/simplemq-cli_0.5.0_linux_arm64.tar.gz'
      sha256 '9aaed373362baf67ad4a37627c46456483c564ddd892d6276121cc0750d6ded0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.5.0/simplemq-cli_0.5.0_linux_amd64.tar.gz'
      sha256 'f3be0b43e5a4e293fefe80e882901b75f5435527c164bca1ccda49fe7ad9eb7e'
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
