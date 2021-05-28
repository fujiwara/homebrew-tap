class MawsCli < Formula
  version '0.0.2'
  homepage 'https://github.com/fujiwara/maws-cli'
  if OS.mac?
    url "https://github.com/fujiwara/maws-cli/releases/download/v0.0.2/maws-cli_0.0.2_darwin_amd64.tar.gz"
    sha256 '64f6ab5a8fe47815998bccb7de81831b06bc2b6d1bad5040005c07d4f985cdf1'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maws-cli/releases/download/v0.0.2/maws-cli_0.0.2_linux_amd64.tar.gz"
    sha256 '1abbec8661cf6581d0148990b0cf015b0e098c09bd04feb99ffedd06427d777b'
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
