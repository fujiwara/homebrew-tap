class Tracer < Formula
  version '0.1.3'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v0.1.3/tracer_0.1.3_darwin_amd64.tar.gz"
    sha256 '061fc780ef65fd93c8ce3794d36d2a84851c460a8cddc45c1e3c7e4efebccb67'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v0.1.3/tracer_0.1.3_linux_amd64.tar.gz"
    sha256 'd0e7f34240076799c784759da7e123712540653f5e120b68b645b6dcf4fc2362'
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
