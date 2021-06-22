class MawsCli < Formula
  version '0.0.3'
  homepage 'https://github.com/fujiwara/maws-cli'
  if OS.mac?
    url "https://github.com/fujiwara/maws-cli/releases/download/v0.0.3/maws-cli_0.0.3_darwin_amd64.tar.gz"
    sha256 '838e629575f5de0ba63dd42911b15af006f7f904b12f401df89a3956da41c02c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maws-cli/releases/download/v0.0.3/maws-cli_0.0.3_linux_amd64.tar.gz"
    sha256 'e127ec1499fed5728f59ad5edf9b1a5ef435191e81c807acef7ee5bb164f4d30'
  end
  head 'https://github.com/fujiwara/maws-cli.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maws'
  end
end
