class Tracer < Formula
  version '0.1.2'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v0.1.2/tracer_0.1.2_darwin_amd64.tar.gz"
    sha256 '965d614b5a3dde40a0400afaa3621784897d006599ef23fbb7834e05818a3a3e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v0.1.2/tracer_0.1.2_linux_amd64.tar.gz"
    sha256 '6f57f52120f0a9278cad2ce49811a9f42d8701bff984c2763efc1d5218658ff9'
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
