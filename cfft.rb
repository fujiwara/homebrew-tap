class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.6.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.0/cfft_0.6.0_darwin_arm64.tar.gz'
      sha256 'b87151ca943854cb7867964265aa1c15c7bc1e5097902bb2fc1743f834ce762b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.0/cfft_0.6.0_darwin_amd64.tar.gz'
      sha256 '8cbdcc6431ca34fbc882fa7f4dbf731a906ec9124da992324d26ff1ce5b89c54'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.0/cfft_0.6.0_linux_arm64.tar.gz'
      sha256 'c347e62b6dcf598373be2ac37b0f8a62d38ace979701a8d6d14b27565adc5d11'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.6.0/cfft_0.6.0_linux_amd64.tar.gz'
      sha256 '337b64bdfd306826e6ab3bb4aa030323885a7ca37cff80d093fcef104cd251e7'
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
