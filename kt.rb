class Kt < Formula
  desc 'Kafka command line tool that likes JSON'
  version '15.1.0'
  homepage 'https://github.com/fujiwara/kt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.0/kt_15.1.0_darwin_arm64.tar.gz'
      sha256 'f555187edf55d53d46f92874712ad5a12e8d8d3cf2f41044669a7f6fe8a6307b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.0/kt_15.1.0_darwin_amd64.tar.gz'
      sha256 '49eaa34930a0bc537cdd96276cdde89a0f24d4248ebcae755eeda654b6944564'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.0/kt_15.1.0_linux_arm64.tar.gz'
      sha256 '4ba7f8baa53a940822c4622d417383ea06745fec77ab4109e69b943c6c5c763b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.0/kt_15.1.0_linux_amd64.tar.gz'
      sha256 '9e96ab3bb961d74f400bceb6e462fd9323f3aacfd8005a783b08770d39016ccb'
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
