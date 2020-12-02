class Lambroll < Formula
  version '0.10.0'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.10.0/lambroll_v0.10.0_darwin_amd64.zip"
    sha256 '0e6360d3b340c3e925c7efc981622cd7b4bfc4582359e2b1a71488b3642d99a9'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.10.0/lambroll_v0.10.0_linux_amd64.tar.gz"
    sha256 'c3d70af6e056b8e6bab0a92afe73f6fee038dd88db722dd12348e9f5225d0f6a'
  end
  head 'https://github.com/fujiwara/lambroll.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'lambroll'
  end
end
