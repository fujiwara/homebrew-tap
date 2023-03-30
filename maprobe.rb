class Maprobe < Formula
  version '0.5.1'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.5.1/maprobe_v0.5.1_darwin_amd64.zip"
    sha256 '543abb41c9956b44b251b384c2cd132f228d0f8b007143c9df0e9802af296f42'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.5.1/maprobe_v0.5.1_linux_amd64.zip"
    sha256 '5a16c63b14a718cb4d9f55628c7ac6cf189ea736084cec51c7e98e34d5751c45'
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
