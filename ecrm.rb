class Ecrm < Formula
  version '0.3.2'
  homepage 'https://github.com/fujiwara/ecrm'
  if OS.mac?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.3.2/ecrm_0.3.2_darwin_amd64.tar.gz"
    sha256 'cd03f46d7f0da1cc85a479ee02f33dfd2f0c3f584e20d40076f7c37f6cdcc857'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.3.2/ecrm_0.3.2_linux_amd64.tar.gz"
    sha256 '99279173fd2fa0afb071f490a97fbc67c51db68e8a6f236e62de13e7a1104e71'
  end
  head 'https://github.com/fujiwara/ecrm.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecrm'
  end
end
