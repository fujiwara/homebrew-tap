class Ecsta < Formula
  version '0.0.5'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.5/ecsta_0.0.5_darwin_amd64.tar.gz"
    sha256 'c2068fd5c6c08b409f4a72008c4efa260b30c33b24923c4605920b3fbab39cac'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.5/ecsta_0.0.5_linux_amd64.tar.gz"
    sha256 'aba597d4d7d40d7eb33d62cb394446c0c98d8cb3f1d4d8f9d099bb6972d7fc8a'
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
