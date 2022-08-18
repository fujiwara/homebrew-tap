class Ecrm < Formula
  version '0.2.0'
  homepage 'https://github.com/fujiwara/ecrm'
  if OS.mac?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.2.0/ecrm_0.2.0_darwin_amd64.tar.gz"
    sha256 'ad3fb3369532de359ca39c25e753088c9f6c0a4d62ad5a2507b1a68c1fd9913d'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.2.0/ecrm_0.2.0_linux_amd64.tar.gz"
    sha256 '54e71bde68ffe8513e872afee2dd3a4b60f9a32e3e4a727b43605e62ce8a67b9'
  end
  head 'https://github.com/fujiwara/ecrm.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecrm'
  end
end
