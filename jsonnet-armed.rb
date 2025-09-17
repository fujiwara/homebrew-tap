class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.8'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.8/jsonnet-armed_0.0.8_darwin_arm64.tar.gz'
      sha256 '82706f1eb8430eeff1ed645103bde2a27c481c71dd544b480954bf90300e404b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.8/jsonnet-armed_0.0.8_darwin_amd64.tar.gz'
      sha256 '8cd68b4767a2ec58c9be8814d81764b7797bcde5773df04ff7acf3b2f1eda694'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.8/jsonnet-armed_0.0.8_linux_arm64.tar.gz'
      sha256 'f4dcc4d45de445ceff47d7eccb8211d72858dc789c4c7dd1c21b27b3003e3d34'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.8/jsonnet-armed_0.0.8_linux_amd64.tar.gz'
      sha256 '2d8b6bb37b20231b03b729d61d5594fa14e89c6a3e20f32f7ef2ac87432b9429'
    end
  end

  head do
    url 'https://github.com/fujiwara/jsonnet-armed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'jsonnet-armed'
  end
end
