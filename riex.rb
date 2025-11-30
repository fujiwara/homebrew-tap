class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.10'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.10/riex_0.0.10_darwin_arm64.tar.gz'
      sha256 'fc7fb8a54c6fe35890194f65f2905c7adfe2d342e47e74a8229d380e311b7f4d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.10/riex_0.0.10_darwin_amd64.tar.gz'
      sha256 '08e325b66b57b37d58b9e550c54eff4f9f6f1bf39615ad8bc976470d511f1a3b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.10/riex_0.0.10_linux_arm64.tar.gz'
      sha256 '147592029b5c5d3f89308d4940b72641bc58fdc961025f1eaa06123fcb1d4fe8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.10/riex_0.0.10_linux_amd64.tar.gz'
      sha256 '1982878a236731f5db1a8139757d8f96b55f14da5b58dbb54bbe012fb586cf28'
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
