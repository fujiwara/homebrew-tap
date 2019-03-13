class Nssh < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/nssh'
  url "https://github.com/fujiwara/nssh/releases/download/v0.1.0/nssh-v0.1.0-darwin-amd64.zip"
  sha256 'e28a7e6a99a251487cb3658a937ba07db82653be12cffe5199439750c9080d0f'
  head 'https://github.com/fujiwara/nssh.git'

  def install
    system 'mv', 'nssh-v0.1.0-darwin-amd64', 'nssh'
    bin.install 'nssh'
  end
end
