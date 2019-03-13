class Stretcher < Formula
  version '0.10.0'
  homepage 'https://github.com/fujiwara/stretcher'
  url "https://github.com/fujiwara/stretcher/releases/download/v0.10.0/stretcher-v0.10.0-darwin-amd64"
  sha256 '7e8796480b45007a39875292d9e55679a1869ade1b0417778d74fd84f27d2eef'
  head 'https://github.com/fujiwara/stretcher.git'

  def install
    system 'mv', 'stretcher-v0.10.0-darwin-amd64', 'stretcher'
    bin.install 'stretcher'
  end
end
