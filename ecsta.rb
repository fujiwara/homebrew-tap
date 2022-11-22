class Ecsta < Formula
  version '0.0.6'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.6/ecsta_0.0.6_darwin_amd64.tar.gz"
    sha256 'e4513bebf5e668e3ea40ca0127e1900f62cd4c21960d893e69e9373449413d98'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.6/ecsta_0.0.6_linux_amd64.tar.gz"
    sha256 '0ed5095dddce8daae4ca4623b92052c18a39e6dc9990dae4fb4f0ad784ee80e4'
  end
  head 'https://github.com/fujiwara/ecsta.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
