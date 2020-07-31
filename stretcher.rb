class Stretcher < Formula
  version '1.0.0'
  homepage 'https://github.com/fujiwara/stretcher'
  url "https://github.com/fujiwara/stretcher/releases/download/v1.0.0/stretcher-v1.0.0-darwin-amd64.zip"
  sha256 'c7876762e88aa94d1ff04b199e31ca6ad1df43a3a29183294d2651db890d89c1'
  head 'https://github.com/fujiwara/stretcher.git'

  def install
    system 'mv stretcher-v*-darwin-amd64 stretcher'
    bin.install 'stretcher'
  end
end
