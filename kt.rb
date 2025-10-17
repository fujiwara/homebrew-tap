class Kt < Formula
  desc 'Kafka command line tool that likes JSON'
  version '16.0.0'
  homepage 'https://github.com/fujiwara/kt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kt/releases/download/v16.0.0/kt_16.0.0_darwin_arm64.tar.gz'
      sha256 'bf3525d82c11b8d400cf9acd1890b7636f0820becce2dc564bf93b90cf393a72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v16.0.0/kt_16.0.0_darwin_amd64.tar.gz'
      sha256 '14d25bc17aa84c74328fa56207222e6dfc8fe2228508fec2c22166b2ffad3212'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kt/releases/download/v16.0.0/kt_16.0.0_linux_arm64.tar.gz'
      sha256 '4a8c145cb9f2116d28ca348e9281f37b29a450982ea1b275e3f206970e8a9fc9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v16.0.0/kt_16.0.0_linux_amd64.tar.gz'
      sha256 '6a7cf20d3465674e2bc2ede9af7d787a5c6babecaf33bc53861608d4bfcce62f'
    end
  end

  head do
    url 'https://github.com/fujiwara/kt.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kt'
  end
end
