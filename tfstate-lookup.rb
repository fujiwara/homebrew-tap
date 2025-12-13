class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.8.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.1/tfstate-lookup_1.8.1_darwin_arm64.tar.gz'
      sha256 'f2c3bcc545cdbd5e961ab500682844a38b697a421397eec9fe8e2409ae1209ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.1/tfstate-lookup_1.8.1_darwin_amd64.tar.gz'
      sha256 '19823e19d239d9eeac9cf61d96a0df8b4d6ddd692ecffa53702a46cd932fb484'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.1/tfstate-lookup_1.8.1_linux_arm64.tar.gz'
      sha256 '72b8ddf385e9d4495b818eb4011a2d57087108a1a2b53b834e07a3532499cea3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.8.1/tfstate-lookup_1.8.1_linux_amd64.tar.gz'
      sha256 '38e5f9c23f4f984c91e8514f9d01843bda4669911abdae8ede1c3ddc64cb4333'
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
