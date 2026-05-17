class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.12.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.0/tfstate-lookup_1.12.0_darwin_arm64.tar.gz'
      sha256 'f3f8c67d38af0f2a88cf402e995641b919c296a72d967d705bc43604f93afcaa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.0/tfstate-lookup_1.12.0_darwin_amd64.tar.gz'
      sha256 '6478589da357b9077dff8c65a30daf364816f8d8e84cddcd785587e2bfe2b3ec'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.0/tfstate-lookup_1.12.0_linux_arm64.tar.gz'
      sha256 'b05ac3bb5fec8360b4dab12df7a0b05cd6f45e522931b7620cdb39865ef4c00e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.12.0/tfstate-lookup_1.12.0_linux_amd64.tar.gz'
      sha256 'f7b824569c5a6f413b797a83113c47e16fe5d9c51d6e0fb386a9db755faf4e1f'
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
