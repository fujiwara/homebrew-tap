class Lambroll < Formula
  version '0.11.1'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.1/lambroll_v0.11.1_darwin_amd64.zip"
    sha256 'b4841d8af9ad4a22abdbc0c83f2831bc3aa7b2a327470a74f434c14dd96c844f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.1/lambroll_v0.11.1_linux_amd64.tar.gz"
    sha256 '3f3b676c54689e376f70a8b305ffa5ad4b0b55a57bc3bbe8834e171187be9025'
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
