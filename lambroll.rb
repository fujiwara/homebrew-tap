class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.6'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.6/lambroll_v1.0.6_darwin_arm64.tar.gz'
      sha256 '8dbca6ac95825b044ec068ed29876146378a9acb38c9f8f9262eca92ccfcc988'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.6/lambroll_v1.0.6_darwin_amd64.tar.gz'
      sha256 '6ce0c11aa27e22ae32e610be4c51ebde636f79f639cc5cfbd4110265ee461515'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.6/lambroll_v1.0.6_linux_arm64.tar.gz'
      sha256 '8a83ff36087e889edf81c22c3f77a99b3f7e86d8a0b206b38ffc5cd6b8a3f995'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.6/lambroll_v1.0.6_linux_amd64.tar.gz'
      sha256 '74c384a78843ff92db205be684c448d96495136003ca114083adec3092e4e89e'
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
