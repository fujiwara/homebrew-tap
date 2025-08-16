class Kt < Formula
  desc 'Kafka command line tool that likes JSON'
  version '14.1.0'
  homepage 'https://github.com/fujiwara/kt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kt/releases/download/v14.1.0/kt_14.1.0_darwin_arm64.tar.gz'
      sha256 'c54be1eeab6e4e170723676a9ad9fcd24eef8fb0ffc38df89a862934c37b2b84'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v14.1.0/kt_14.1.0_darwin_amd64.tar.gz'
      sha256 '9f280910ec66a2ae6c252ff4cafad3a607a9cea062cad681dcd11dc0e6d99a19'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kt/releases/download/v14.1.0/kt_14.1.0_linux_arm64.tar.gz'
      sha256 '19bb0eed3f56422ffa3c6ae6f6081d264d3f204cd7748fa278ce94ba87b6fa2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v14.1.0/kt_14.1.0_linux_amd64.tar.gz'
      sha256 'd1fcb3c7543ab321c721152dc18a3077a49443a9f9e1e632fa79692d18d83d44'
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
