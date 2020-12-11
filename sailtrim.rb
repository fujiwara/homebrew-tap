class Sailtrim < Formula
  version '0.0.2'
  homepage 'https://github.com/fujiwara/sailtrim'
  if OS.mac?
    url "https://github.com/fujiwara/sailtrim/releases/download/v0.0.2/sailtrim_0.0.2_darwin_amd64.tar.gz"
    sha256 '0a3b4c3fd1701f263ed99f9bdca2c0f194604743ab5b9e4ff4a42aa28b563ca4'
  end
  if OS.linux?
    url "https://github.com/fujiwara/sailtrim/releases/download/v0.0.2/sailtrim_0.0.2_linux_amd64.tar.gz"
    sha256 'a6fff8b12a22a77eb486aad22bcfc026ceab3c9e98ef99aaa6f340383e25b659'
  end
  head 'https://github.com/fujiwara/sailtrim.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'sailtrim'
  end
end
