class Ecsta < Formula
  version '0.1.2'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.1.2/ecsta_0.1.2_darwin_amd64.tar.gz"
    sha256 '56c2033d62584c13005234e310def5d5eb8800077121f8bafff78344f1d9ef5f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.1.2/ecsta_0.1.2_linux_amd64.tar.gz"
    sha256 '86298955e6cd44ab02dcac407e573f825488e3384b49d2a36adf8c3a3fa77fb2'
  end
  head 'https://github.com/fujiwara/ecsta.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
