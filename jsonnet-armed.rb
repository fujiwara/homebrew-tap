class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.5'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.5/jsonnet-armed_0.0.5_darwin_arm64.tar.gz'
      sha256 'e858c07fbd2bc9cf3130dd88b83e7b8ce8251fb4434dfc89af716191d6d66c9e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.5/jsonnet-armed_0.0.5_darwin_amd64.tar.gz'
      sha256 '305d0be56fb10c7e13f73b249a20c7fbebd4e7a08c4af16362674010a27fce49'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.5/jsonnet-armed_0.0.5_linux_arm64.tar.gz'
      sha256 'e9c32e12644ce0a7dcf2ec89a616d25f16e418a66ab39cae2d093e70aad336f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.5/jsonnet-armed_0.0.5_linux_amd64.tar.gz'
      sha256 'cc92527361ca1783fbc8004448993983a8733ce762f3003ef8679a9ee9e257d7'
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
