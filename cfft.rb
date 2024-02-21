class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.5.2'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.2/cfft_0.5.2_darwin_arm64.tar.gz'
      sha256 'd9958786c502d5237d0d14c3713892eda2250a62835908acd678fb2483ec09cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.2/cfft_0.5.2_darwin_amd64.tar.gz'
      sha256 '3543ace9d56d7e9c997145e7bb60f01cc274706d8e41ff590a820ce0a26aff0d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.2/cfft_0.5.2_linux_arm64.tar.gz'
      sha256 'd2bfe7301033f6c7e01f69c51c47bb9e59f0dc91e90395cc037ad3435bcc570f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.2/cfft_0.5.2_linux_amd64.tar.gz'
      sha256 'fc6c2c0332963f307aacc5992a5f1f43dc162cdf1eccbc6f2a70a8d0bf37cfc0'
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
