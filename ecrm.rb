class Ecrm < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/ecrm'
  if OS.mac?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.3.1/ecrm_0.3.1_darwin_amd64.tar.gz"
    sha256 'b4e14372668eff87d22bc704bc30e50a048ac1d64e423bb1ffea81bd4a68e927'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.3.1/ecrm_0.3.1_linux_amd64.tar.gz"
    sha256 'c4f49289b999c84857bb89e8a1a863c7519973f604ad37667971f9b261bcfcef'
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
