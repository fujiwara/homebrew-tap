class Tracer < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v0.0.4/tracer_0.0.4_darwin_amd64.tar.gz"
    sha256 '8a587061408b0387ce996361c49cae7dec081a89cf35898ea1844131115e1702'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v0.0.4/tracer_0.0.4_linux_amd64.tar.gz"
    sha256 '431999ad782912ce45b79c11140d33452a3955f84a903070be1640e33fd40244'
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
