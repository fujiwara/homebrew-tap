class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.4.3'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.3/lambroll_v1.4.3_darwin_arm64.tar.gz'
      sha256 '27abf6f5c7320b0c1c300eec983173c23026774686387c4c7980e4781af7a77f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.3/lambroll_v1.4.3_darwin_amd64.tar.gz'
      sha256 'f2b9e28c5dedc93b4cc80768f3478695b165870cf70e4fbda891e7cd38c4d8d1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.3/lambroll_v1.4.3_linux_arm64.tar.gz'
      sha256 'c17dc5af406f9e996978972db24c31881e1ef42d9701232c4f360fda6d7e97ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.4.3/lambroll_v1.4.3_linux_amd64.tar.gz'
      sha256 '3702b7d1d84b359ee057dbd86c4d011a66f60e452f04247999e25e5128836638'
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
