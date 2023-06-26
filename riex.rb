class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.6'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.6/riex_0.0.6_darwin_arm64.tar.gz'
      sha256 'fb0cf1d12894237cba5be58f8d7a5827de414b2360096f9e1c332db0ef35ca97'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.6/riex_0.0.6_darwin_amd64.tar.gz'
      sha256 '78196341bbb5433da9027337889831288d6ba3263dc9781ad18b5e30b3866fc4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.6/riex_0.0.6_linux_arm64.tar.gz'
      sha256 'd9af1666ac42828703fbe994917225e35e48e191cff5962bc93055c4f7459c1d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.6/riex_0.0.6_linux_amd64.tar.gz'
      sha256 '5330319e4b3a3a6cf6f446f58c6e55778a8d928441f13ef981fdf1bf9def8db5'
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
