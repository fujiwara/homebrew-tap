class Maprobe < Formula
  version '0.7.4'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.4/maprobe_v0.7.4_darwin_amd64.zip"
    sha256 '0baae1e481256a2e25859f06a6334fc14b3affe0cc528cee3df074bdaa2201a3'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.4/maprobe_v0.7.4_linux_amd64.zip"
    sha256 '6d3c3c2b2305202714bd55079eebb1cbec918dc1aa65e1116d4c20cfe4d4857d'
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
