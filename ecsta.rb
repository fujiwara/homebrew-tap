class Ecsta < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.4/ecsta_0.0.4_darwin_amd64.tar.gz"
    sha256 '4a99f3a665c584fea976ad859a62c2abc40f6d6d271e26bf7238c0667b76095f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.4/ecsta_0.0.4_linux_amd64.tar.gz"
    sha256 '8d12a8f4d12a48f82f5a52116817bd5ab6255f1211f2b075cc6fb3834dd704ab'
  end
  head 'https://github.com/fujiwara/ecsta.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
