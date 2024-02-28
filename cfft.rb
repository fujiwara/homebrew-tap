class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.6.2'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.2/cfft_0.6.2_darwin_arm64.tar.gz'
      sha256 '3b8a6750e9f2b53f0dd10213187ccd6a756cf8a21f29f7033f1ff18079bd6638'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.2/cfft_0.6.2_darwin_amd64.tar.gz'
      sha256 'e48e011c70daa4d07eab4ba72fdd31d430364e325decab94be5bb3311aff2a57'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.2/cfft_0.6.2_linux_arm64.tar.gz'
      sha256 'b2cdb4479e1f32ab0f605072800225c2e3a8646fd81956ed2f35b0699c393878'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.2/cfft_0.6.2_linux_amd64.tar.gz'
      sha256 '2d760cb0186629af85bcd65435f56b6dd4ea21ce836666887280c9f437afa7c9'
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
