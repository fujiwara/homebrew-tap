class TfstateLookup < Formula
  version '0.1.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.1/tfstate-lookup_0.1.1_darwin_amd64.tar.gz"
    sha256 '1c09b39965d888fbbe1b33415267f632fa2a77a594da9f9ba086cf9c1810c3db'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.1/tfstate-lookup_0.1.1_linux_amd64.tar.gz"
    sha256 '882f02ff0d3718e777b5b504d54846b472d76b5e464ee5dc5e29ec55bb43bb23'
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
