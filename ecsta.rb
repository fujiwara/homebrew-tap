class Ecsta < Formula
  version '0.2.0'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.2.0/ecsta_0.2.0_darwin_amd64.tar.gz"
    sha256 '34664355913644f17e6df95a03a9f634d2522a0b51975f5ae964c38f171f5197'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.2.0/ecsta_0.2.0_linux_amd64.tar.gz"
    sha256 '07c6c0b67d16c2a48b149f5a58addb16f1da5075df362f02f2a23e250714f3bd'
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
