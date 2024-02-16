class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.5.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.0/cfft_0.5.0_darwin_arm64.tar.gz'
      sha256 'fe7f069cf924679f10bef5fa80cc0194c52ca744b1c2e3f21edd99dbc98dfb62'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.0/cfft_0.5.0_darwin_amd64.tar.gz'
      sha256 '64fb73ef6584246081f7130c058865a8e54c93539c8b22c93acb406f692d4e3d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.0/cfft_0.5.0_linux_arm64.tar.gz'
      sha256 '6be7d511248d972387d586bdd1270208ae47785199f323e1723ef4e3ec76272e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.5.0/cfft_0.5.0_linux_amd64.tar.gz'
      sha256 '3a44c9b2ca580a54cfcc72049804233f1127b3f56d113ee75c875ced00903515'
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
