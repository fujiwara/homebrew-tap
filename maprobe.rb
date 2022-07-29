class Maprobe < Formula
  version '0.4.5'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.5/maprobe_v0.4.5_darwin_amd64.zip"
    sha256 '39e56122a30649b04f455c2dff52ce373df3a3e5b1db3a92b9c4c5603ff8e89f'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.4.5/maprobe_v0.4.5_linux_amd64.zip"
    sha256 '265a42caeed4b864cf7f8d57da7cfdc36fc3cf239ca8b8e70e1b2a112fc67b52'
  end
  head 'https://github.com/fujiwara/maprobe.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maprobe'
  end
end
