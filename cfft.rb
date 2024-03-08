class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.8.1'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.1/cfft_0.8.1_darwin_arm64.tar.gz'
      sha256 'c5786737b4cf8ff6ebab474ad903f51b39436210eedf3b79def0102788715160'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.1/cfft_0.8.1_darwin_amd64.tar.gz'
      sha256 'd4d12bebcac41c6cb5a7fe57c910cc691a1f15214e946e57544a5851f4b21afc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.1/cfft_0.8.1_linux_arm64.tar.gz'
      sha256 '2767f638df7484dc104a7fa05ba2d1ddce2e65b2fe2ed5b12ab1bd763bd99abc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.1/cfft_0.8.1_linux_amd64.tar.gz'
      sha256 '4c2c8825240100fd6acdc9bce61e82e4fc58d2b7ab20896597878c3873df2ff0'
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
