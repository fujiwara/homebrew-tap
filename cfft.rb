class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.0.8'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.8/cfft_0.0.8_darwin_arm64.tar.gz'
      sha256 '3927fa0d20390d6ea6d22c98286ca917431b899ab19d32eca584e8b364ba1883'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.8/cfft_0.0.8_darwin_amd64.tar.gz'
      sha256 'ba060ff89483fa28a84da0cd7d31da2765b93e48dcff258244b28ae76b25a87f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.8/cfft_0.0.8_linux_arm64.tar.gz'
      sha256 '835ef96771db821dedda56f584e81eba8c086b63e1d1912c05131f4728af958b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.8/cfft_0.0.8_linux_amd64.tar.gz'
      sha256 '58179dfb64c27cc6d4ce8245641413c2dff9b3644b3e4bea30eb0e3bc893d487'
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
