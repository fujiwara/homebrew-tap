class Xk6S3 < Formula
  desc 'A k6 extension for load testing S3-compatible object storage.'
  version '0.2.3'
  homepage 'https://github.com/fujiwara/xk6-s3'
  license 'Apache-2.0'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.3/xk6-s3_v0.2.3_darwin_arm64.tar.gz'
      sha256 '06b2ebd6857084d8ddd2a0fe0a11fa51bda0c6e89243512608f1730442886f54'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.3/xk6-s3_v0.2.3_darwin_amd64.tar.gz'
      sha256 'e4793a03809003ddbce148b83899d757be2d78b94c2aea5b6955fbd6ff91ba92'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.3/xk6-s3_v0.2.3_linux_arm64.tar.gz'
      sha256 'e70778abaa76d3ac447dc5f6c98450f9e9d8c68d33bcc92389466cd7e481e98c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.3/xk6-s3_v0.2.3_linux_amd64.tar.gz'
      sha256 '08780206fda68da0bcd76ea99acf292f03f92170f50b71439ab5d89d0e6dbaa5'
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
