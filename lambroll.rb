class Lambroll < Formula
  version '0.11.4'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.4/lambroll_v0.11.4_darwin_amd64.zip"
    sha256 '835b8b016d668a32a3647dd962477ad08e8cb1c3c37fc45c3d94e5f9ff66f934'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.4/lambroll_v0.11.4_linux_amd64.tar.gz"
    sha256 '82ce3eb4ecae44647377f3932215d9d08e5961f9b73e3da4ddb76960573f47ba'
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
