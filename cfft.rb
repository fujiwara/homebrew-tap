class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.8.2'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.2/cfft_0.8.2_darwin_arm64.tar.gz'
      sha256 '1e144945588c2905e42ae5d046f2b0e7a3a8256ee5e0287b9f3fd6a3042e04ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.2/cfft_0.8.2_darwin_amd64.tar.gz'
      sha256 'a9f7b544f516a5e3224a7f4a7d9309adadc238d82e8c1a82b1e4c418c6f6bd4e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.2/cfft_0.8.2_linux_arm64.tar.gz'
      sha256 '0d4cd79e1ea24ca3277276513234744802ad849e524db88608531b2feec213d6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.2/cfft_0.8.2_linux_amd64.tar.gz'
      sha256 'fd38dfeeb8500caa3a9b5d6d15586ba998c91facec840c78f3c5b8ad79c66633'
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
