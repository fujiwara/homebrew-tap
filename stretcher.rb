class Stretcher < Formula
  version '1.1.0'
  homepage 'https://github.com/fujiwara/stretcher'
  if OS.mac?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.1.0/stretcher-v1.1.0-darwin-amd64.zip"
    sha256 '1820d440ef7dda55b6fdd97f699ec7a8f0aff5e9c782d806e7602f780752de67'
  end
  if OS.linux?
    url "https://github.com/fujiwara/stretcher/releases/download/v1.1.0/stretcher-v1.1.0-linux-amd64.zip"
    sha256 '1506412d1974a6652cb11c601d0566f6063ab39a51bbb0cf0dd687318accd3c0'
  end
  head 'https://github.com/fujiwara/stretcher.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv stretcher-v*-*-amd64 stretcher'
    bin.install 'stretcher'
  end
end
