class SimplemqCli < Formula
  version '0.3.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.3.0/simplemq-cli_v0.3.0_darwin_arm64.tar.gz'
      sha256 '0811cdd72f5d388169228ffa2e59c0958321e69a6214154101e296f7e2d7b7e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.3.0/simplemq-cli_v0.3.0_darwin_amd64.tar.gz'
      sha256 '0156d5fa39ccadbda7ca3279f97c5f3359a3459df304eb00c2a3d0f0face030c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.3.0/simplemq-cli_v0.3.0_linux_arm64.tar.gz'
      sha256 '911761ede7899701ec325a7f26a2563d100bf6a23896f4225eea6cca37fd4ecf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.3.0/simplemq-cli_v0.3.0_linux_amd64.tar.gz'
      sha256 '96d9c715b35928d6f5dbd727e131bed2aaecb63eed40a02f5c202cf03af8bbd5'
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
