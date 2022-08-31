class Tracer < Formula
  version '1.0.0'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v1.0.0/tracer_1.0.0_darwin_amd64.tar.gz"
    sha256 'd86581fe8714de882a4869113191dd7ae1602aea331579f61fc1ec6192c6c0fd'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v1.0.0/tracer_1.0.0_linux_amd64.tar.gz"
    sha256 'c84aad622ffae635419282cd5258a6eba572be83482025b9829345eb42da8c77'
  end
  head 'https://github.com/fujiwara/tracer.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tracer'
  end
end
