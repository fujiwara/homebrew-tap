class Xk6S3 < Formula
  desc 'A k6 extension for load testing S3-compatible object storage.'
  version '0.2.4'
  homepage 'https://github.com/fujiwara/xk6-s3'
  license 'Apache-2.0'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.4/xk6-s3_v0.2.4_darwin_arm64.tar.gz'
      sha256 '9c82783a96f9af0758bc4723cebf5d2cd0acbf2862ed60780f11980dcbd0bb3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.4/xk6-s3_v0.2.4_darwin_amd64.tar.gz'
      sha256 'f187985212833576e99cc0c141b9dfbc9e8ed8721a15360a86ea0380abdacd44'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.4/xk6-s3_v0.2.4_linux_arm64.tar.gz'
      sha256 'b54eac90a47b0b28bed000b9c30c934320f9b81704df2af818082899c93c55a7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/xk6-s3/releases/download/v0.2.4/xk6-s3_v0.2.4_linux_amd64.tar.gz'
      sha256 'c3869bb4e6a413e7a2f5a8dda6f979e26d9cbbe4e8ccc18d7be1beb44e3a18b5'
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
