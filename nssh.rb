class Nssh < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/nssh'
  if OS.mac?
    url "https://github.com/fujiwara/nssh/releases/download/v0.1.0/nssh-v0.1.0-darwin-amd64.zip"
    sha256 'e28a7e6a99a251487cb3658a937ba07db82653be12cffe5199439750c9080d0f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/nssh/releases/download/v0.1.0/nssh-v0.1.0-linux-amd64.zip"
    sha256 'e37a22e871969a0fbf415d9142ffe649615b545b89e94bb34f614942b85fb284'
  end
  head 'https://github.com/fujiwara/nssh.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv nssh-v*-*-amd64 nssh'
    bin.install 'nssh'
  end
end
