class Rin < Formula
  version '1.2.0'
  homepage 'https://github.com/fujiwara/rin'
  if OS.mac?
    url "https://github.com/fujiwara/Rin/releases/download/v1.2.0/Rin_1.2.0_darwin_amd64.tar.gz"
    sha256 'fb6186659721edd609f1e1fb396f2c760f643cba15db106a913a9b0ab3bf51d5'
  end
  if OS.linux?
    url "https://github.com/fujiwara/Rin/releases/download/v1.2.0/Rin_1.2.0_linux_amd64.tar.gz"
    sha256 '071abfdc6c4298e2012471dc6b5755f9df986e09fc328f605c9305efc1507757'
  end
  head 'https://github.com/fujiwara/rin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'rin'
  end
end
