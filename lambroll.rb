class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.1'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.1/lambroll_v1.0.1_darwin_arm64.tar.gz'
      sha256 '0c4f1995c009123e40bfbfc48522ef6a4f455b12f39cb91a50905eee5158ed5d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.1/lambroll_v1.0.1_darwin_amd64.tar.gz'
      sha256 '9994cd06f95b9cad5baaf1c4cc7197f1c144256530d9124debf27b1525eef1f7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.1/lambroll_v1.0.1_linux_arm64.tar.gz'
      sha256 'dbbf36b9ee97062bcc65e695d0364b94972d59a2d1748f3f9ce63b804b2f5ee8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.1/lambroll_v1.0.1_linux_amd64.tar.gz'
      sha256 'd409fdb22dba5ef53c057f7cacb0f04b06cb68397f4ef1903aaa42c86f778dc4'
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
