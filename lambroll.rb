class Lambroll < Formula
  version '0.2.2'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.2.2/lambroll_v0.2.2_darwin_amd64.zip"
  sha256 '935b4b5e0e54181df5227bed7f2c255700557e874ba06a204bd56b5012ed5cfe'
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
