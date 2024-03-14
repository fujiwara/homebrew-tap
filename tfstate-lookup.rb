class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.7'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.7/tfstate-lookup_1.1.7_darwin_arm64.tar.gz'
      sha256 'f6ef5a8fd10ea8d71dbf947dee25f7e8a78fc4efc1c37694f38b647cf4d6fc50'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.7/tfstate-lookup_1.1.7_darwin_amd64.tar.gz'
      sha256 '968fda2bd250283f333e4670505764d5826499bf23a394cca41ef0b453067c4b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.7/tfstate-lookup_1.1.7_linux_arm64.tar.gz'
      sha256 '8ffdf2dcdb597157fc9bb4d202a697af746ebb77b048ec123d301e6b5be0ae4c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.7/tfstate-lookup_1.1.7_linux_amd64.tar.gz'
      sha256 'e218ff21bf2aa4bb2ebd181b762c8d4cb93c1683b44c3153c8b2376118a7533c'
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
