class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.1.0'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.0/lambroll_v1.1.0_darwin_arm64.tar.gz'
      sha256 '96db6c7ba2b65924ab934d3d21a6eaa42edfae254da505ba6177fa03e6a54732'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.0/lambroll_v1.1.0_darwin_amd64.tar.gz'
      sha256 'c1630317033f8e9a0e62e019ce29a88f3fd59941b1cf1aaf05126f35b520cd05'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.0/lambroll_v1.1.0_linux_arm64.tar.gz'
      sha256 'f30a34bb6aee5c7afd6d34e41a3f2bba1dba957c4b835c3a82098e34879d73b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.0/lambroll_v1.1.0_linux_amd64.tar.gz'
      sha256 'd934583881783a2d4e400dff661960973ce4b60703818e993f2d3f0f48adb483'
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
