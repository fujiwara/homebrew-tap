class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.0.5'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.5/lambroll_v1.0.5_darwin_arm64.tar.gz'
      sha256 '22a30d7856c836f2eb8aa7d2285dc10f8ba1f1120ec7a382c03d38feb27c8f99'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.5/lambroll_v1.0.5_darwin_amd64.tar.gz'
      sha256 'bd0e173b66739d55c0555ba87c65bd7fade9f28ae6d0178ac9e8470b0e500163'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.5/lambroll_v1.0.5_linux_arm64.tar.gz'
      sha256 '9a881a99b7cbad9dd2fcd21e45d88e5148abfbb5477b9c3ed1c29d1a45b8fefc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.0.5/lambroll_v1.0.5_linux_amd64.tar.gz'
      sha256 '1ecc72b83bce6b9086f29cb31938de80540ecc8dc2258fe2f9cefc47f0bb29d5'
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
