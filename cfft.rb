class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.6.1'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.1/cfft_0.6.1_darwin_arm64.tar.gz'
      sha256 '75e6e0f19e563b845d6c79eb942e8c93deadabc3cae9effa652364e9a4174f0c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.1/cfft_0.6.1_darwin_amd64.tar.gz'
      sha256 '767471dfc05779cdaa6065d5713b5a36782f3229c5700240044d4a2677893f40'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.1/cfft_0.6.1_linux_arm64.tar.gz'
      sha256 '018e3197b1738b2327d848736abfcf9492aa6efa4890117796e3c091c60d0213'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.1/cfft_0.6.1_linux_amd64.tar.gz'
      sha256 'c3a6103372b808de4a86bb3831061a8d893b884f8e9f9868f9292d6b9ac411b8'
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
