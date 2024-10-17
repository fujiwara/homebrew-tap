class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.1.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.2/lambroll_v1.1.2_darwin_arm64.tar.gz'
      sha256 'eae763a238aa14325bc0bd1405526d6028f421cea0123dbac4cdc96259663042'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.2/lambroll_v1.1.2_darwin_amd64.tar.gz'
      sha256 '60b7f307cedb89b7a28ffde62cb4230ec1fa7d0722943937b4ef678e7dfb5007'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.2/lambroll_v1.1.2_linux_arm64.tar.gz'
      sha256 '40d102752d2fc29022e00b4e728e9c7f54be709019d2eea9352bae8a10f48b4b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.1.2/lambroll_v1.1.2_linux_amd64.tar.gz'
      sha256 'eb3fa512d07ada79e0cae27d77cf5bb10b6bcf1e5d1f9f14119b6b567a1a9d10'
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
