class Ecsta < Formula
  version '0.0.1'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.1/ecsta_0.0.1_darwin_amd64.tar.gz"
    sha256 'bc2cd2672929a91b64a029b29ec71ad1ea1afbc0ad467f306777c88b753c8e0a'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.1/ecsta_0.0.1_linux_amd64.tar.gz"
    sha256 'a734aa9dd6301919a5b0870ff42217a7925be7a7c95d80bd3da5f80bdc1995e2'
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
