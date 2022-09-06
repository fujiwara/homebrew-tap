class Ecrm < Formula
  version '0.3.3'
  homepage 'https://github.com/fujiwara/ecrm'
  if OS.mac?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.3.3/ecrm_0.3.3_darwin_amd64.tar.gz"
    sha256 '2d0c77ae23a4e0a09e8821c61489028c25e7b68fd8765a68457aa02780db929e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecrm/releases/download/v0.3.3/ecrm_0.3.3_linux_amd64.tar.gz"
    sha256 'e1a831f43a7110475151c36bd03364001d4b1f3ad12138c3b36c42e2f020dd8f'
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
