class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.8.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.0/tfstate-lookup_1.8.0_darwin_arm64.tar.gz'
      sha256 '9f52b61ec18aa4dc1c083a3b09ed8e998638de44be76100e885e9fc464f9e9df'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.0/tfstate-lookup_1.8.0_darwin_amd64.tar.gz'
      sha256 '93a1c08ccee98b12e93bc7dabd9b0c2cde06a7a9626abd82ae3b5ff87df415fc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.0/tfstate-lookup_1.8.0_linux_arm64.tar.gz'
      sha256 '31c45531eea5356456e9327b3125c6d2f6b9511a258cd230417af84aac310764'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.0/tfstate-lookup_1.8.0_linux_amd64.tar.gz'
      sha256 '224ae94ecd74512d893bef9afff5a13eabe32b97dad73ffa383f1bf1577ca76e'
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
