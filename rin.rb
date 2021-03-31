class Rin < Formula
  version '1.1.2'
  homepage 'https://github.com/fujiwara/rin'
  if OS.mac?
    url "https://github.com/fujiwara/Rin/releases/download/v1.1.2/Rin_1.1.2_darwin_amd64.tar.gz"
    sha256 '509df1d1659bd72aedcbc63faf49ba7bea796a1a9752bb2fe3cd62143fa2ecc5'
  end
  if OS.linux?
    url "https://github.com/fujiwara/Rin/releases/download/v1.1.2/Rin_1.1.2_linux_amd64.tar.gz"
    sha256 '4a316384295df85d161a20adbee052ba5f66256137934cd4f6273e5458b54eb6'
  end
  head 'https://github.com/fujiwara/rin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'rin'
  end
end
