class Stretcher < Formula
  version '1.0.1'
  homepage 'https://github.com/fujiwara/stretcher'
  if OS.mac?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.0.1/stretcher-v1.0.1-darwin-amd64.zip"
    sha256 '62f18323e9f80a8d526f64dfb9e2253355567a540d844edcd84fae4b56a846eb'
  end
  if OS.linux?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.0.1/stretcher-v1.0.1-linux-amd64.zip"
    sha256 'b41ddee810a7db0b0f3832eab76000a5157e1f6fe6afc6f9b699523618939f35'
  end
  head 'https://github.com/fujiwara/stretcher.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv stretcher-v*-*-amd64 stretcher'
    bin.install 'stretcher'
  end
end
