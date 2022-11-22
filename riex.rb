class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.2'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.2/riex_0.0.2_darwin_arm64.tar.gz'
      sha256 '02e140b1f0f1038548a1263790a5adfec46f10576e65a6f6886567922c0f2283'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.2/riex_0.0.2_darwin_amd64.tar.gz'
      sha256 '0c8c966f4e5799769d6d2c6bd43d2d9f7cdc4a38d7142646491c53453c12a8c0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.2/riex_0.0.2_linux_arm64.tar.gz'
      sha256 '7522f03605fb99ed93bfa68c3bf6a513d17a9e51d3b554ea623ac55c46339bc5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.2/riex_0.0.2_linux_amd64.tar.gz'
      sha256 '126822d7fcfcafbda1522395d7f4299a514522ce59c7ba9b313f28d0b9741b0d'
    end
  end

  head do
    url 'https://github.com/fujiwara/riex.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'riex'
  end
end
