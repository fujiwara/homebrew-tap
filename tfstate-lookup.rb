class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.9.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.9.0/tfstate-lookup_1.9.0_darwin_arm64.tar.gz'
      sha256 'ca54bc802e71dac24714b8face2b9aba8636e9ec6790f39c26cb982cf3133464'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.9.0/tfstate-lookup_1.9.0_darwin_amd64.tar.gz'
      sha256 '613ec62425ef28a37bbb60b4614a4a3c152b3c41fe49b19cef673d19d56fd6ee'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.9.0/tfstate-lookup_1.9.0_linux_arm64.tar.gz'
      sha256 '7fa042dc3e12a6c5653694b37800770d32f56ee635d3679ba5d4943cf9e140c9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.9.0/tfstate-lookup_1.9.0_linux_amd64.tar.gz'
      sha256 'c035d3de32337f0751f9074aa806904d07ff4d7b70a7e858e17ec1fba291cf5c'
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
