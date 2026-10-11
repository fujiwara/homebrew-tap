class Xk6S3 < Formula
  desc 'A k6 extension for load testing S3-compatible object storage.'
  version '0.2.1'
  homepage 'https://github.com/fujiwara/xk6-s3'
  license 'Apache-2.0'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.1/xk6-s3_v0.2.1_darwin_arm64.tar.gz'
      sha256 'db0e49478ca1d516b9c143d73eb2350cc3832670ecd6b7cdb246521d49a412f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.1/xk6-s3_v0.2.1_darwin_amd64.tar.gz'
      sha256 '7fbcd55124d689fe9e9ef0d35dc4c566cdf502241da5a416bfade4df517b9417'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.1/xk6-s3_v0.2.1_linux_arm64.tar.gz'
      sha256 'd9ef12002665f09214a682e6787606efe31719b7ec6f20f27b83e7eb150b3bfd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.1/xk6-s3_v0.2.1_linux_amd64.tar.gz'
      sha256 '913ca1830411c2c672c8a51d480efb074d7fadc606bb0bbb6743f539ddb3ba95'
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
