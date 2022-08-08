class Ecsta < Formula
  version '0.0.2'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.2/ecsta_0.0.2_darwin_amd64.tar.gz"
    sha256 '3e0e76a89b5fa7d4f8a00a9c1430e51487e9520a3d3f4ae6f5c6afcfc0b915cb'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.2/ecsta_0.0.2_linux_amd64.tar.gz"
    sha256 '8e25c00e25558ce1a53c53963e768414b5654d2ec2cf1fd81fc4dd6bc9e9c3f8'
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
