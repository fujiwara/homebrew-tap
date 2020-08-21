class Macaroni < Formula
  version '0.0.1'
  homepage 'https://github.com/fujiwara/macaroni'
  if OS.mac?
    url "https://github.com/fujiwara/macaroni/releases/download/0.0.1/macaroni_0.0.1_darwin_amd64.zip"
    sha256 '441aa12dd98856afed33a0d87d4a02542d2e4abd81f496ff294935ae92ee41cb'
  end
  if OS.linux?
    url "https://github.com/fujiwara/macaroni/releases/download/0.0.1/macaroni_0.0.1_linux_amd64.tar.gz"
    sha256 '95c3d91c2531c6a9ea493fe0cfc410e45e16516e1da179d5363c08754bed0807'
  end
  head 'https://github.com/fujiwara/macaroni.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'macaroni'
  end
end
