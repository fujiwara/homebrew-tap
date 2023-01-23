class Sardine < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/sardine'
  if OS.mac?
    url "https://github.com/fujiwara/sardine/releases/download/v0.4.0/sardine_0.4.0_darwin_amd64.tar.gz"
    sha256 '16fec4dcd68d05eb101c428bea17069ccebae3228c97d9c1590a0992633fd93c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/sardine/releases/download/v0.4.0/sardine_0.4.0_linux_amd64.tar.gz"
    sha256 '758a42fdaedd0661868816e22928c26fc78bc76098b116de428053147dcf2699'
  end
  head 'https://github.com/fujiwara/sardine.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'sardine'
  end
end
