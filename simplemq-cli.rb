class SimplemqCli < Formula
  version '0.9.2'
  homepage 'https://github.com/fujiwara/simplemq-cli'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.2/simplemq-cli_0.9.2_darwin_arm64.tar.gz'
      sha256 '98d02fe7848f7b63b8c90e589217a5a84fa77b6f4f4edaa055fb9e28a6a15754'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.2/simplemq-cli_0.9.2_darwin_amd64.tar.gz'
      sha256 'd6d7b715f237e534d36bbca5c16a2574ac85d873458e4e8fb024476ff699c492'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.2/simplemq-cli_0.9.2_linux_arm64.tar.gz'
      sha256 'ca14161f2734e2320ae33e5637249efbc2047e9291b95c743a9bd5c3a748de4b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.9.2/simplemq-cli_0.9.2_linux_amd64.tar.gz'
      sha256 '6ffe2ae32ba251a4fc6ee02a0f947e8bb1dce24f73baef26be1219dbe9aafcb3'
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

  test do
    system "#{bin}/simplemq-cli", '-h'
  end
end
