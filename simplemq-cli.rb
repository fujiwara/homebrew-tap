class SimplemqCli < Formula
  version '0.6.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.6.0/simplemq-localserver_0.6.0_darwin_arm64.tar.gz'
      sha256 '6883d030f1797fdcfb542cba1031fc36e50f62dd17ac2424ab0fb386682fed7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.6.0/simplemq-localserver_0.6.0_darwin_amd64.tar.gz'
      sha256 '01849764cac41cf732a6d3b2f5148672ec7be91f9205bb20945498230a83ace6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.6.0/simplemq-localserver_0.6.0_linux_arm64.tar.gz'
      sha256 'd4f31a9ff6421882e813a85e69be04fdd00ac813a551a133ef1ad4534445ccf9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.6.0/simplemq-localserver_0.6.0_linux_amd64.tar.gz'
      sha256 'f800b3c0e419b7367987490da5b213ab50f47a500d6723016f6378c18a2d4786'
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
