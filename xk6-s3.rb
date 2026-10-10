class Xk6S3 < Formula
  desc 'A k6 extension for load testing S3-compatible object storage.'
  version '0.2.0'
  homepage 'https://github.com/fujiwara/xk6-s3'
  license 'Apache-2.0'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.0/xk6-s3_v0.2.0_darwin_arm64.tar.gz'
      sha256 '29adc4e73e89cac0ab2c162fdd9f93cbdc1ece2584aad543efd0b7fca54522c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.0/xk6-s3_v0.2.0_darwin_amd64.tar.gz'
      sha256 'f7c09990d7ed4a924063f229abe754d561778824332b360b3642694614c6ba62'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.0/xk6-s3_v0.2.0_linux_arm64.tar.gz'
      sha256 'db7902d1fc162fe6503c3700103bd6d4afe312d8d4fa0ad01adf7fb72867a842'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.0/xk6-s3_v0.2.0_linux_amd64.tar.gz'
      sha256 '9a8738b592497426938f50fa1028449d4b865704653b2bc9a21323b387d5ae1e'
    end
  end

  head do
    url 'https://github.com/fujiwara/xk6-s3.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'xk6-s3'
  end

  test do
    system "#{bin}/xk6-s3", '-h'
  end
end
