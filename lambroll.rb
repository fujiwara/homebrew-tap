class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.6.1'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.1/lambroll_v1.6.1_darwin_arm64.tar.gz'
      sha256 '756c5870b8738def7b35fd007c6f3ac1269f5bbe6f934f1d74a297f55946eb73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.1/lambroll_v1.6.1_darwin_amd64.tar.gz'
      sha256 '8d99484762fb9b2818b8c2570cbd88ef8b762efc100477d8085bc8eced4be9a8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.1/lambroll_v1.6.1_linux_arm64.tar.gz'
      sha256 'b30e69f993eb68a35016407289fee43bedf9e6eec7c4dcc63f84c3edad12c458'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.6.1/lambroll_v1.6.1_linux_amd64.tar.gz'
      sha256 'bf3761c879026d161e350c2e9196e8cbb557e2d2cf8ef7be7575e10f54116c41'
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
