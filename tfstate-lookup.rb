class TfstateLookup < Formula
  version '0.4.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.0/tfstate-lookup_0.4.0_darwin_amd64.tar.gz"
    sha256 '3174d67ccac77ddcbeff96031c559ff3a9314473f62cf16265fc9fa6ddd9f86e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.4.0/tfstate-lookup_0.4.0_linux_amd64.tar.gz"
    sha256 'e13aa897c14d2e0260df05beb59d6d879317a80be3ec63e90877cf6b5dca1785'
  end
  head 'https://github.com/fujiwara/tfstate-lookup.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
