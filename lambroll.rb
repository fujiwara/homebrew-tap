class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.3.0'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.0/lambroll_v1.3.0_darwin_arm64.tar.gz'
      sha256 'c510f0ddf297b0f1df2158ce21c8d215d0a98a41cb4c61ff338300586d90f657'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.0/lambroll_v1.3.0_darwin_amd64.tar.gz'
      sha256 'f4399a2fcccd5db450ac96e4bac50b87b84ff06ce6575369099375076c8bbc65'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.0/lambroll_v1.3.0_linux_arm64.tar.gz'
      sha256 'b18b41109b36bce37c9f52dd7cbc8ccf26d2e4bf0ef83e5f256e7cc9e781fc86'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.3.0/lambroll_v1.3.0_linux_amd64.tar.gz'
      sha256 'daef483472a5a933104451edafa41075ec88e5e5ed0a2a8a2bf737117b40e2f8'
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
