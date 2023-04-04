class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.1/tfstate-lookup_1.1.1_darwin_arm64.tar.gz'
      sha256 '0b61fbe4571e38dac202be06fa4ace8ae15450428d5f061d8391fed55036ee25'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.1/tfstate-lookup_1.1.1_darwin_amd64.tar.gz'
      sha256 '68460c67b81eca51b2742ea8f947f17b70fa969762168da72282cd43ed5ed325'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.1/tfstate-lookup_1.1.1_linux_arm64.tar.gz'
      sha256 '6dd27196ddf5ea04026a5bce3e161204500667a6ce351ef960cb08c6efe79471'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.1/tfstate-lookup_1.1.1_linux_amd64.tar.gz'
      sha256 '8bf4c2e8a0696c8490e43a2acded3f26e3b8dfeac0ef9c983e83bf5a1e17dafa'
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
