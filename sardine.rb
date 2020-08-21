class Sardine < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/sardine'
  if OS.mac?
    url "https://github.com/fujiwara/sardine/releases/download/v0.3.1/sardine_v0.3.1_darwin_amd64.zip"
    sha256 'c6028174516966a79be8bfaab10e5b113ec715d72266cd4cf2f4fbd8f9e6b599'
  end
  if OS.linux?
    url "https://github.com/fujiwara/sardine/releases/download/v0.3.1/sardine_v0.3.1_linux_amd64.zip"
    sha256 '42dd3cc7c30aceecfd718154b417fe2636fd1b12edf92a67f70914020e584de1'
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
