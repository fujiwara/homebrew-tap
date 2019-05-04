class Macaroni < Formula
  version '0.0.1'
  homepage 'https://github.com/fujiwara/macaroni'
  url "https://github.com/fujiwara/macaroni/releases/download/0.0.1/macaroni_0.0.1_darwin_amd64.zip"
  sha256 '441aa12dd98856afed33a0d87d4a02542d2e4abd81f496ff294935ae92ee41cb'
  head 'https://github.com/fujiwara/macaroni.git'

  def install
    bin.install 'macaroni'
  end
end
