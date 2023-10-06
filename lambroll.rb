class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '0.14.5'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.5/lambroll_v0.14.5_darwin_arm64.zip'
      sha256 'e352d8ca3dad71f4213bd7751e14d840bb715a5d8abb693a86ed427a64612703'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.5/lambroll_v0.14.5_darwin_amd64.zip'
      sha256 '174b61e47a56a3f42299194429e7caf1fa561281a945c37a31bc26e72e36a61b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.5/lambroll_v0.14.5_linux_arm64.tar.gz'
      sha256 'af32898055f9a9b6a5800c58cb72c9d32d3b42258d01306c720487e342efd020'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.5/lambroll_v0.14.5_linux_amd64.tar.gz'
      sha256 '8e158cf86e2a9bef801b7519b924d115ccd7c3cdacaba206f2c36e259ec730db'
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
