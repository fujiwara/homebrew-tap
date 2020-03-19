class Lambroll < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.4.0/lambroll_v0.4.0_darwin_amd64.zip"
  sha256 'dfe153025cb1d3291c5e50c3ea6bb777f3dc8069911f37b595e0d419f93f1ff2'
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
