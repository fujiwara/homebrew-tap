class Tracer < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/tracer'
  if OS.mac?
    url "https://github.com/fujiwara/tracer/releases/download/v0.1.0/tracer_0.1.0_darwin_amd64.tar.gz"
    sha256 '34ce355184daa01450362cb2f317d148aded1b7ac8ae9fd90b13e0063b747a3d'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tracer/releases/download/v0.1.0/tracer_0.1.0_linux_amd64.tar.gz"
    sha256 '11122424f1205d45b3dbc7b720e9736bda30b67bcd19478ad2aa2b710e47f04b'
  end
  head 'https://github.com/fujiwara/tracer.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tracer'
  end
end
