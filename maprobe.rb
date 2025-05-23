class Maprobe < Formula
  version '0.7.7'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.7/maprobe_v0.7.7_darwin_amd64.zip"
    sha256 '1cd2369d120216cca430eb8536a9de772e4b63064daed7338b1f8c637a48deac'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.7/maprobe_v0.7.7_linux_amd64.zip"
    sha256 '08512b768d51e77ef36c953126f8726a77dcbca41bfa43261309eba84e5bbca2'
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
