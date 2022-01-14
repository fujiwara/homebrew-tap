class Rin < Formula
  version '1.1.4'
  homepage 'https://github.com/fujiwara/rin'
  if OS.mac?
    url "https://github.com/fujiwara/Rin/releases/download/v1.1.4/Rin_1.1.4_darwin_amd64.tar.gz"
    sha256 '8d45972aed6e8e83c76ea394ff3d49992fed8bdf4beac5730cbda8fd476018a5'
  end
  if OS.linux?
    url "https://github.com/fujiwara/Rin/releases/download/v1.1.4/Rin_1.1.4_linux_amd64.tar.gz"
    sha256 '1173448b185864a6c42f6a74611b9805a6c37be6b2c6e590924ed0f4ed6ad811'
  end
  head 'https://github.com/fujiwara/rin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'rin'
  end
end
