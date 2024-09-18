class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.4.2'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.2/tfstate-lookup_1.4.2_darwin_arm64.tar.gz'
      sha256 '21717704e508f20d49348625a301d7f5745f9f22d6efa892781db29e15af7102'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.2/tfstate-lookup_1.4.2_darwin_amd64.tar.gz'
      sha256 'ba75379b862f8683d22ce1f081c21f19a4ce40c70c12c772a01b08dd7b170fa4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.2/tfstate-lookup_1.4.2_linux_arm64.tar.gz'
      sha256 'f08f06863115518c3dee5889327c393da73e8ebc9f78b8fc66cb3be85cfccf1d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.2/tfstate-lookup_1.4.2_linux_amd64.tar.gz'
      sha256 'bd9d1816a4fe62318856f2feb871e17ccc42991077d2c834565966fd8bf7d2fb'
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
