class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.0/tfstate-lookup_1.1.0_darwin_arm64.tar.gz'
      sha256 '35a32d621fb6b145b708dc498d598b46e644bde7b8f442caa3a2a4d6c217b6a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.0/tfstate-lookup_1.1.0_darwin_amd64.tar.gz'
      sha256 '1054cfcd2221639a4b825f77098f220b31ccde80ac8290a534c9db5f9b6d1f39'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.0/tfstate-lookup_1.1.0_linux_arm64.tar.gz'
      sha256 '5dd24210997ff0e24ddf70a71b2fc4c738d0f0d3b630e413ca28486bdcc64cd5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.0/tfstate-lookup_1.1.0_linux_amd64.tar.gz'
      sha256 '9472488afcf262ab973cd47e391731bede8ac6ab388db3846356f6fd9a9823f7'
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
