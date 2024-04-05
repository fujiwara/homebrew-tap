class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.3'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.3/lambroll_v1.0.3_darwin_arm64.tar.gz'
      sha256 '962557932180128a36e678f42609d66724161e09b58a1c4f9e12029367180692'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.3/lambroll_v1.0.3_darwin_amd64.tar.gz'
      sha256 'f07d8f79fa3db8c8a15b087f68bc2cc3af3c3546bdf65fd26de4208e4e1236e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.3/lambroll_v1.0.3_linux_arm64.tar.gz'
      sha256 '67a8314230d0b6f4719428e111fa1b436b506a0f495a8fb307db3113bac66cf4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.3/lambroll_v1.0.3_linux_amd64.tar.gz'
      sha256 '110b4f9cb12d3b075913e9072474e61538d9e5fc72e0fef15760e50f4eaf9a13'
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
