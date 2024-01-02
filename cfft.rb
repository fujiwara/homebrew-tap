class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.1.0/cfft_0.1.0_darwin_arm64.tar.gz'
      sha256 '7939fa2871bd73548a748f5756954a323b3858859ca5dcc2b5e7e0db1f4756f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.1.0/cfft_0.1.0_darwin_amd64.tar.gz'
      sha256 'ba9a73df9bd376944cdfc22c7877fb11bc1122379d577656f392fc1b63632902'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.1.0/cfft_0.1.0_linux_arm64.tar.gz'
      sha256 'e921d8dae4ca065670d3f5140e4acc4aee7197afa20d9a2c3008b73ab013f9d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.1.0/cfft_0.1.0_linux_amd64.tar.gz'
      sha256 '98111a728ab16a1071c4c44ea95661276a43ca07a2f1f4b978e8224e0e48e8ed'
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
