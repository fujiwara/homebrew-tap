class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.5.0'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.0/lambroll_v1.5.0_darwin_arm64.tar.gz'
      sha256 'c93461f87d9abeb3be672db35902dcd29531185dfaa372133ec4eaa312db5544'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.0/lambroll_v1.5.0_darwin_amd64.tar.gz'
      sha256 '537f226a12b51436d9ae392d4d7bec63d25bfc8222eecc1b945529a6bcfe507a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.0/lambroll_v1.5.0_linux_arm64.tar.gz'
      sha256 '3d8e5339ece49dfa07e2b2c916132368edf9816e903319af2da392f1b05c49a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.0/lambroll_v1.5.0_linux_amd64.tar.gz'
      sha256 '9672741a1f97717c1ccdcd34f422c867d7afb456f81a3d90c766e00fa14dce03'
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
