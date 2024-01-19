class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.3.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.3.0/cfft_0.3.0_darwin_arm64.tar.gz'
      sha256 '581bbff51a975ce20fee7815b1740571e89e4bc2e2b3a1a6289a63f0bae975bd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.3.0/cfft_0.3.0_darwin_amd64.tar.gz'
      sha256 '70d9b5d4b8d1e61c4557f542998e119e84bca010c90fede67813a31906a85fa5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.3.0/cfft_0.3.0_linux_arm64.tar.gz'
      sha256 '78896603cbe2bf80643b09caf6842055f9072b78fc6255a67133a6d450a1099a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.3.0/cfft_0.3.0_linux_amd64.tar.gz'
      sha256 'ae44c50811644ed4b77c8271b37d6e41d436ece9909343eba8a5288996309da6'
    end
  end

  head do
    url 'https://github.com/fujiwara/cfft.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cfft'
  end
end
