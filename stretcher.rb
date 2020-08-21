class Stretcher < Formula
  version '1.0.0'
  homepage 'https://github.com/fujiwara/stretcher'
  if OS.mac?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.0.0/stretcher-v1.0.0-darwin-amd64.zip"
    sha256 'c7876762e88aa94d1ff04b199e31ca6ad1df43a3a29183294d2651db890d89c1'
  end
  if OS.linux?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.0.0/stretcher-v1.0.0-linux-amd64.zip"
    sha256 '0dd4b8bbc97c003a6b481b0dd7cfbe2a8a48ff582b1483e69d21d9bc9a87f469'
  end
  head 'https://github.com/fujiwara/stretcher.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv stretcher-v*-darwin-amd64 stretcher'
    bin.install 'stretcher'
  end
end
