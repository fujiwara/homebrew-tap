class Tracer < Formula
  version '0.0.3'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v0.0.3/tracer_0.0.3_darwin_amd64.tar.gz"
    sha256 '485a5b20846dc8989206d0119776c620c21d97b3b337904787ce62419e94a5a0'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v0.0.3/tracer_0.0.3_linux_amd64.tar.gz"
    sha256 'a5b677929c7b815536c23841a875f056cb3aabd6868c07419a033c3b8b39690b'
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
