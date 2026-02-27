class SimplemqCli < Formula
  version '0.2.2'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.2/simplemq-cli_v0.2.2_darwin_arm64.tar.gz'
      sha256 '2a30fef52428857cd3496a3e923f168aa3b582677f3706e602a0a7a22e310f31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.2/simplemq-cli_v0.2.2_darwin_amd64.tar.gz'
      sha256 '15d0228445f221f7006da03c6c0702ebfbcb44f7da8d08d22dc6e4cea61be7d5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.2/simplemq-cli_v0.2.2_linux_arm64.tar.gz'
      sha256 'fd7a8486ea8558288d6d213952356ab8a6382e77dee93142f21a6c021fc2d6b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.2.2/simplemq-cli_v0.2.2_linux_amd64.tar.gz'
      sha256 '74cd344cf99fca05f90e736e28b6f981b28ce0d9d36ab8447ac1d7083ec5233c'
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
