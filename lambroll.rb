class Lambroll < Formula
  version '0.6.2'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.6.2/lambroll_v0.6.2_darwin_amd64.zip"
  sha256 'cfe8976191a6a8533962ee6f8dcbeb6ddc5c3cb84833c9302f02d91f418efac9'
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
