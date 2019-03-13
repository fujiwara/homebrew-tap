class Stretcher < Formula
  version '0.10.0'
  homepage 'https://github.com/fujiwara/stretcher'
  url "https://github.com/fujiwara/stretcher/releases/download/v0.10.0/stretcher-v0.10.0-darwin-amd64.zip"
  sha256 'c6eaecc1fee42cf708130d121cbb5d0103401c6d1fc498902bc14ccf2509a13a'
  head 'https://github.com/fujiwara/stretcher.git'

  def install
    system 'mv', 'stretcher-v0.10.0-darwin-amd64', 'stretcher'
    bin.install 'stretcher'
  end
end
