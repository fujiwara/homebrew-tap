class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.0.7'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.7/cfft_0.0.7_darwin_arm64.tar.gz'
      sha256 '92aaaaa2e1960cbbcdf7b1a32c4b3eb297402a2f1e8754bf6ed3ac93352f994f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.7/cfft_0.0.7_darwin_amd64.tar.gz'
      sha256 '1947d46d7125ed9ab521784c1ac9fe4818d9fe0a3d6d8d334613f91d75c17552'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.7/cfft_0.0.7_linux_arm64.tar.gz'
      sha256 '443e35704d70aa7588a50bdf493d7a83b3d4e558837c4bd28076c9698d4b2b26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.0.7/cfft_0.0.7_linux_amd64.tar.gz'
      sha256 'a11b8c1c7a56fe85027cfdd1d49fbd6cab47a685bd3acf77aa7527f0850ece36'
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
