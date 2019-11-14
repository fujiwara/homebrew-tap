class Lambroll < Formula
  version '0.3.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.3.0/lambroll_v0.3.0_darwin_amd64.zip"
  sha256 '87012bbfd4b6ab0b5c76acdd59f4e9163dd01d75e69ea143bc883493b7b22784'
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
