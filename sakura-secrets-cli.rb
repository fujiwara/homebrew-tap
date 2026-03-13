class SakuraSecretsCli < Formula
  version '0.3.0'
  homepage 'https://github.com/fujiwara/sakura-secrets-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.0/sakura-secrets-cli_v0.3.0_darwin_arm64.tar.gz'
      sha256 '87d0902aa9e235af1ce874714efff4555ea278e61788e1fb0c32eb7e09541714'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.0/sakura-secrets-cli_v0.3.0_darwin_amd64.tar.gz'
      sha256 'c8666f3109bc290695da92a9a1250073d3ad4a61ab3db88ffa019ad7825daa64'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.0/sakura-secrets-cli_v0.3.0_linux_arm64.tar.gz'
      sha256 'a9ad3e9d23fbb3d542926aa2ee119689819f51cfc9844a76a4215c894cd5d04b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/sakura-secrets-cli/releases/download/v0.3.0/sakura-secrets-cli_v0.3.0_linux_amd64.tar.gz'
      sha256 '9e191029d75918c3db27efc23da59f03a8a180d28e60cfcb0533a8207d0d6594'
    end
  end

  head do
    url 'https://github.com/fujiwara/sakura-secrets-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'sakura-secrets-cli'
  end
end
