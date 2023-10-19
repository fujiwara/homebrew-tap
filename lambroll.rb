class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '0.14.6'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.6/lambroll_v0.14.6_darwin_arm64.zip'
      sha256 'db0f1670f5a7979305ec806e3ce56c37cb835823f6e4329bde7026aaefa17e71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.6/lambroll_v0.14.6_darwin_amd64.zip'
      sha256 '042604c3ab990cccd9f42329c2c0e998d0200b287ab6408ed6f33dcdf2f225b6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.6/lambroll_v0.14.6_linux_arm64.tar.gz'
      sha256 '33bf9337877c9a477748527e673e82bf0d499e6e50b0fdadabfb511c07ed40d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.6/lambroll_v0.14.6_linux_amd64.tar.gz'
      sha256 'a26ed64c9dd0ada97bfd65ff5e04e5839ee1c8918e9b9412bf9c55e46d1742c2'
    end
  end

  head do
    url 'https://github.com/fujiwara/lambroll.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
      system 'mv', 'cmd/lambroll/lambroll', '.'
    end
    bin.install 'lambroll'
  end
end
