class Sardine < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/sardine'
  url "https://github.com/fujiwara/sardine/releases/download/v0.3.1/sardine_v0.3.1_darwin_amd64.zip"
  sha256 'c6028174516966a79be8bfaab10e5b113ec715d72266cd4cf2f4fbd8f9e6b599'
  head 'https://github.com/fujiwara/sardine.git'

  def install
    bin.install 'sardine'
  end
end
