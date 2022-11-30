class Lambroll < Formula
  version '0.14.1'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.14.1/lambroll_v0.14.1_darwin_amd64.zip"
    sha256 '3c3862e30a461f9744cd05559109e51e0f9cdc6415ab94e8433eb876b0d5ba78'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.14.1/lambroll_v0.14.1_linux_amd64.tar.gz"
    sha256 'd9483a934285fd78fd31bacef838b8997300b60d533bbe5b78afaf8133f6a21a'
  end
  head 'https://github.com/fujiwara/lambroll.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
      system 'mv', 'cmd/lambroll/lambroll', '.'
    end
    bin.install 'lambroll'
  end
end
