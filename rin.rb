class Rin < Formula
  version '0.1.3'
  homepage 'https://github.com/fujiwara/Rin'
  url "https://github.com/fujiwara/Rin/releases/download/v0.1.3/rin-v0.1.3-darwin-amd64.zip"
  sha256 '669e0d3f5c79341bcff182f3f6d89eb6317ae0ae5838ff20da534676e17f0721'
  head 'https://github.com/fujiwara/Rin.git'

  def install
    system 'mv', 'rin-v0.1.3-darwin-amd64', 'rin'
    bin.install 'rin'
  end
end
