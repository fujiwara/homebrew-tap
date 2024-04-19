class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.4'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.4/lambroll_v1.0.4_darwin_arm64.tar.gz'
      sha256 '25338a0f819c3b172e08c872483989d57597d67e8498a571f4f1b21616156e2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.4/lambroll_v1.0.4_darwin_amd64.tar.gz'
      sha256 'eba6c25875bf0adb7c590361ac5dbd1c487d6a618a8cf3a9bab4250917d7214c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.4/lambroll_v1.0.4_linux_arm64.tar.gz'
      sha256 '2561a72d313afbc9cf6cc74212c436cb073772b096293197645b20fd31ca06f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.4/lambroll_v1.0.4_linux_amd64.tar.gz'
      sha256 'c01cc693b35fe108eef22e12aa27629ac68d04a13519d28578e12e33e4cbe9fa'
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
