class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.7.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.7.0/cfft_0.7.0_darwin_arm64.tar.gz'
      sha256 'a8e2f05c270a437e9a39c2b36148b59fb3badbf0ae9bc8bce39f616b34611015'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.7.0/cfft_0.7.0_darwin_amd64.tar.gz'
      sha256 '71f8ce226ecd6404000b55c1bc3bfaa3259b5aca1c1af46a30b4fe271da9a28e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.7.0/cfft_0.7.0_linux_arm64.tar.gz'
      sha256 '004d484ad34d8975ada90224f6d9151d622304455445fdfdbf90bd9715ee30a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.7.0/cfft_0.7.0_linux_amd64.tar.gz'
      sha256 'f1893b2644e05546342c9abe061fa1e62122715a5ac9a99f7b0f459d65265895'
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
