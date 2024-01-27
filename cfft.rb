class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.4.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.4.0/cfft_0.4.0_darwin_arm64.tar.gz'
      sha256 '5c9115b97c6dc52c0e8e4c496017400dc4c4838ad6b929f3e518c61bc8c2f698'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.4.0/cfft_0.4.0_darwin_amd64.tar.gz'
      sha256 '3cd62273cef63c0b06251b575890419ed9432f7d79e89ef01b475140bc8d7634'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.4.0/cfft_0.4.0_linux_arm64.tar.gz'
      sha256 'd08f5a9f6fcaa7a824f642cc330fe1aba9b635e073dcd3ff9468668a7186fd0a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.4.0/cfft_0.4.0_linux_amd64.tar.gz'
      sha256 '737f4755c75c77c4fa9b0ef49d091893591563681b5fc00f58ddbaf8d9ea3de7'
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
