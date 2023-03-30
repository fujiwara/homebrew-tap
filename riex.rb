class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.3/riex_0.0.3_darwin_arm64.tar.gz'
      sha256 '11e35e7ede4b85f854b5155b07faac512a9966d1d749a41e90dd4241ae479a8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.3/riex_0.0.3_darwin_amd64.tar.gz'
      sha256 'f590779bebf866d4ab3769dc2c4ee2f0c4275ce52a7efe1c99cddcb7cc03d4c2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.3/riex_0.0.3_linux_arm64.tar.gz'
      sha256 'f03e8cade58869eb8cf69001fcab9e000a3bb624e638e16a97e7a700af0a07ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.3/riex_0.0.3_linux_amd64.tar.gz'
      sha256 '7b619d8e04d8820e631f07053c951a15aba342b812a47c26c7f4ea1e5d5e0786'
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
