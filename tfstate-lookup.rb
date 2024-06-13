class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.3.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.1/tfstate-lookup_1.3.1_darwin_arm64.tar.gz'
      sha256 '79dcb49832f57a4dbfd473dec1ff047827af66055679505654b3e210c9187407'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.1/tfstate-lookup_1.3.1_darwin_amd64.tar.gz'
      sha256 '1e3306938189039ba3394f857812c3beb4630ad6571f3da3e6304a25395f67e8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.1/tfstate-lookup_1.3.1_linux_arm64.tar.gz'
      sha256 '755bef99d0f98b3903fa25ede82ed39b419c96bc002386a6c4a0c766fd698f74'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.3.1/tfstate-lookup_1.3.1_linux_amd64.tar.gz'
      sha256 '93b9f1eb870fdfe61fc71909e4e853682dbe0e2f02d83d2eb3e36621a9d6294a'
    end
  end

  head do
    url 'https://github.com/fujiwara/tfstate-lookup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
