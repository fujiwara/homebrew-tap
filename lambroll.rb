class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '0.14.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.2/lambroll_v0.14.2_darwin_arm64.zip'
      sha256 'afd653ce86d5e70888c24265569a7ed4dd90d4067a8a605b4e3e1a76c29323b3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.2/lambroll_v0.14.2_darwin_amd64.zip'
      sha256 'af5346166791a63686340894864270bbed9c33f16f20a4a04f99bd6eb7f0f90e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.2/lambroll_v0.14.2_linux_arm64.tar.gz'
      sha256 '0a35a49f9667ec32dfd416d079db088823fcedd57e9a80c3f39ca9a288065ae8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.2/lambroll_v0.14.2_linux_amd64.tar.gz'
      sha256 'cd2a3f0b647356eddbfd8cf881dbfd1ca988ada3899f8c543f1203ae9d15b1a7'
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
