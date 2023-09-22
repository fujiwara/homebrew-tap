class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '0.14.4'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.4/lambroll_v0.14.4_darwin_arm64.zip'
      sha256 '8abd0566d95b8407e4d6f362063d8a59c9911d99f02065fd62e7d66f0dbee620'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.4/lambroll_v0.14.4_darwin_amd64.zip'
      sha256 '1110187da2387f80e8e1ef19e956799644d3bd0b8be873ee91d3ede45e6c111f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.4/lambroll_v0.14.4_linux_arm64.tar.gz'
      sha256 'fdc2378131f820ebdd23168c75358534ab0ea504025ce9abb80b6f667be8f00b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.4/lambroll_v0.14.4_linux_amd64.tar.gz'
      sha256 '9aa741b21699901545c946371bbb2d055b4deaf41601173bffdd7860861b2e52'
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
