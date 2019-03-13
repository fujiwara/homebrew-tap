class Aswrap < Formula
  version '0.0.3'
  homepage 'https://github.com/fujiwara/aswrap'
  url "https://github.com/fujiwara/aswrap/releases/download/v0.0.3/aswrap"
  sha256 '1ba8944941f248306f248804dd77d23daa4a22ddcb6ac1c9eb5245c7e66f8d80'
  head 'https://github.com/fujiwara/aswrap.git'

  def install
    bin.install 'aswrap'
  end
end
