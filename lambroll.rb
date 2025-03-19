class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.2.2'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.2/lambroll_v1.2.2_darwin_arm64.tar.gz'
      sha256 '4db6f73fbfc816e0b765cee131ac4d7ec32c5254ec9cd02e236d37db17f01e78'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.2/lambroll_v1.2.2_darwin_amd64.tar.gz'
      sha256 '71583911021b0f45485cd3c9d6afdfba677a5a4a6255152ea5c6635082cf1c22'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.2/lambroll_v1.2.2_linux_arm64.tar.gz'
      sha256 '01abaa76c3b56e97ec70a53ba8109046e4069acf54538effcb140ec0b2a47fd8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.2.2/lambroll_v1.2.2_linux_amd64.tar.gz'
      sha256 '87d35c1ce661dac08a34d5db7438adbc691ff8c8203a7b9900898ca69fe24082'
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
