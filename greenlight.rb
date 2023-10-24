class Greenlight < Formula
  desc 'greenlight is a graceful health check agent.'
  version '0.0.6'
  homepage 'https://github.com/fujiwara/greenlight'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.6/greenlight_0.0.6_darwin_arm64.tar.gz'
      sha256 'a27c38a62defcb5af479aa8b5f5116d5088707b67335e24adde710d489838b3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.6/greenlight_0.0.6_darwin_amd64.tar.gz'
      sha256 '27494a8e93d056d047f6e2c54c7ad8a6dec42d93030fe61ec94b4b6d496b7271'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.6/greenlight_0.0.6_linux_arm64.tar.gz'
      sha256 '8c25e757f8a74a46b59b1444be34a4fe12c9c2a6866455c92b2b64bc5e886b2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.6/greenlight_0.0.6_linux_amd64.tar.gz'
      sha256 '1975745b240c056b88239651dc7db9810f0e1335b3abed9551d2fe4c2377fb54'
    end
  end

  head do
    url 'https://github.com/fujiwara/greenlight.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'greenlight'
  end
end
