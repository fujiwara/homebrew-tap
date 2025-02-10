class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.2.0'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.0/lambroll_v1.2.0_darwin_arm64.tar.gz'
      sha256 'a86972cc55c8d9b866ef98408b5020ce33a3e3c375eb1bfb1cdb673205f75fa5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.0/lambroll_v1.2.0_darwin_amd64.tar.gz'
      sha256 '1d31edee0f11e0f62e230b3300f2859f54c6af1234368d74d0623c1770506a32'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.0/lambroll_v1.2.0_linux_arm64.tar.gz'
      sha256 '0f65ee2c9ef18a2676248793776aa6b9ec6cf1ee71ab2585b622f87be67fb1f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.0/lambroll_v1.2.0_linux_amd64.tar.gz'
      sha256 '1ecbc5be1b68be3640b53ba5e2170f9675d5a1bba800616adc2f174bdbec5cee'
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
