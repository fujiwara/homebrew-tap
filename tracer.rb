class Tracer < Formula
  version '0.0.1'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v0.0.1/tracer_0.0.1_darwin_amd64.tar.gz"
    sha256 'd8fee02e1cc70643563ce293f31034580b02404a62f69a576f8476d3eabf7cfc'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v0.0.1/tracer_0.0.1_linux_amd64.tar.gz"
    sha256 '8c52f2f10a44313a306a3066871dfc68ab83a9c78ef9e9f4c5fed4ad7d56b981'
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
