class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.7'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.7/riex_0.0.7_darwin_arm64.tar.gz'
      sha256 'e9a76423ed183e9204f94756fa66e016bf214d0ce697a52c531b7f7b00f7fab9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.7/riex_0.0.7_darwin_amd64.tar.gz'
      sha256 '8fca06ff36284ae161744fe798b6eb5d3012285a7acc5c62d6a435cab97d8a13'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.7/riex_0.0.7_linux_arm64.tar.gz'
      sha256 'd4e163eb4bbb9cba7fe3036b62fcb8372039fc5f1a0209f94627c7c68502aba5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.7/riex_0.0.7_linux_amd64.tar.gz'
      sha256 '81d6f5c6e02b76f48bfff3ddb1d01353e2f9874595c916a8c47ade2020fbccab'
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
