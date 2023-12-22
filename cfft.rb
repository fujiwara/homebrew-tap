class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.3/cfft_0.0.3_darwin_arm64.tar.gz'
      sha256 '7a6794166b2844ad8db17126ea894889dfae2e082459b6980c0401e05d144d42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.3/cfft_0.0.3_darwin_amd64.tar.gz'
      sha256 'e119e960d8774e2e108d92eaef7c5b398848f1317b8dd6ffe10a08ac7b96b7b0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.3/cfft_0.0.3_linux_arm64.tar.gz'
      sha256 '72828b8f798504abbfb1f1cd6cdcd50f624647099ecfefd49acd33677b8aceef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.3/cfft_0.0.3_linux_amd64.tar.gz'
      sha256 '47dd166d13f6edc54c6c19272c32e99b10cef1c56c0be0c453e87ac4fbc544f8'
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
