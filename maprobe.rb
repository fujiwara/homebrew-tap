class Maprobe < Formula
  version '0.9.2'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.9.2/maprobe_0.9.2_darwin_amd64.tar.gz"
    sha256 'f4007f01c585fdf4021540fd7a6e51d5383c1979ff64a7abd0f8d11602ac8694'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.9.2/maprobe_0.9.2_linux_amd64.tar.gz"
    sha256 'ef4b28d6d512a23a0fed08ae8cf5adf0368642d37af26864ed7df542ea35d53a'
  end
  head 'https://github.com/fujiwara/maprobe.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maprobe'
  end
end
