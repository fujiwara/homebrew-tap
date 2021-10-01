class Lambroll < Formula
  version '0.11.9'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.9/lambroll_v0.11.9_darwin_amd64.zip"
    sha256 'bd2c8a5d0058cace1f543284bd2c08a9d7d09163f278a41010826f89e9534199'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.9/lambroll_v0.11.9_linux_amd64.tar.gz"
    sha256 '5b7fc1121eb94e777b3be76f26f914e51ae91abdc8f8cdc633fc524bab6b6f9f'
  end
  head 'https://github.com/fujiwara/lambroll.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'lambroll'
  end
end
