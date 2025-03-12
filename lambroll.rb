class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.2.1'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.1/lambroll_v1.2.1_darwin_arm64.tar.gz'
      sha256 '18521b37203ec0279febc52ee85d9c2bc4bf0f4f8adb3fcac7105a819659c2a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.1/lambroll_v1.2.1_darwin_amd64.tar.gz'
      sha256 '9e1859795390cafa254e5e0e0c3dad005813673839e1b5244f1e27b8839b7c8f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.1/lambroll_v1.2.1_linux_arm64.tar.gz'
      sha256 '41b8b380865d65ffb9c48d41fec7fa50af235e7aef28ffc73551896688e689db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.1/lambroll_v1.2.1_linux_amd64.tar.gz'
      sha256 '15e29c7c87e26d9e49cf94a66529dccb13030c196213bbfa2a9878977ace7825'
    end
  end

  head do
    url 'https://github.com/fujiwara/lambroll.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
      system 'mv', 'cmd/lambroll/lambroll', '.'
    end
    bin.install 'lambroll'
  end
end
