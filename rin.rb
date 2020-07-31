class Rin < Formula
  version '1.0.1'
  homepage 'https://github.com/fujiwara/Rin'
  url "https://github.com/fujiwara/Rin/releases/download/v1.0.1/rin-v1.0.1-darwin-amd64.zip"
  sha256 '231dfdda42e5723d76483597b0c5d1e200fbef8b97260dafe0f67fd0e27de72c'
  head 'https://github.com/fujiwara/Rin.git'

  def install
    system 'mv rin-v*-darwin-amd64 rin'
    bin.install 'rin'
  end
end
