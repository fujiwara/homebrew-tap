class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.2.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.2.0/cfft_0.2.0_darwin_arm64.tar.gz'
      sha256 '02454960d7a1198cbce900cfb6f89a9e71e20d1b1f03ce4b0d5dc41e2807aca4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.2.0/cfft_0.2.0_darwin_amd64.tar.gz'
      sha256 '64e0f983c6f4df1eb2556245f9a00323d38f54c4f7b7c729429dce2a73791e4b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.2.0/cfft_0.2.0_linux_arm64.tar.gz'
      sha256 'efe2594a753a95e73dd023daf0d877df0ad7a2a51463036dbee3548bb19a9e28'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.2.0/cfft_0.2.0_linux_amd64.tar.gz'
      sha256 'fafb9624e00ab4369857de48e12221e5ce195830a9e5003acd789f1dad3b8651'
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
