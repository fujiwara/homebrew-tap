class Lambroll < Formula
  version '0.7.0'
  homepage 'https://github.com/fujiwara/lambroll'
  url "https://github.com/fujiwara/lambroll/releases/download/v0.7.0/lambroll_v0.7.0_darwin_amd64.zip"
  sha256 'bcb0f30f637c13f1b70a9bafbaa9cb1cbf6f7d74a90f53c385e0410cd2f25e8d'
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
