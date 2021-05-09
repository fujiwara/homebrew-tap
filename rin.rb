class Rin < Formula
  version '1.1.3'
  homepage 'https://github.com/fujiwara/rin'
  if OS.mac?
    url "https://github.com/fujiwara/Rin/releases/download/v1.1.3/Rin_1.1.3_darwin_amd64.tar.gz"
    sha256 '7efa179496cfd69e87434c758d64a074a846c72d03af37b1e4c3b5121ed85eae'
  end
  if OS.linux?
    url "https://github.com/fujiwara/Rin/releases/download/v1.1.3/Rin_1.1.3_linux_amd64.tar.gz"
    sha256 '7e9f1287d8571b034d4492a5dc1db607932bf49e7938cccc96cad88c8d040e46'
  end
  head 'https://github.com/fujiwara/rin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'rin'
  end
end
