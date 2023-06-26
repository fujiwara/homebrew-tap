class Stretcher < Formula
  version '1.0.2'
  homepage 'https://github.com/fujiwara/stretcher'
  if OS.mac?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.0.2/stretcher-v1.0.2-darwin-amd64.zip"
    sha256 'c82ff48a28d060ef1f64c61ccd7e064217526a5930e42f7149e8e598ce8b62bb'
  end
  if OS.linux?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.0.2/stretcher-v1.0.2-linux-amd64.zip"
    sha256 'd5fba88f0c23daa31dd16e5fee25665bc90210cead8b3c503a16eeee8d57ff1a'
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
