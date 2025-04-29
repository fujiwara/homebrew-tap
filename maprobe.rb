class Maprobe < Formula
  version '0.7.5'
  homepage 'https://github.com/fujiwara/maprobe'
  if OS.mac?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.5/maprobe_v0.7.5_darwin_amd64.zip"
    sha256 '6c2373c551bd15df0f3cb4e768347f7a6e6b6c9292d2ad0f4796be0e8ecf2491'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maprobe/releases/download/v0.7.5/maprobe_v0.7.5_linux_amd64.zip"
    sha256 '5cc52de9106bc74d3deae30afa72e62baa3d8eec87b7f830d2ed53c73a292fca'
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
