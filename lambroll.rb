class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '0.14.3'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.3/lambroll_v0.14.3_darwin_arm64.zip'
      sha256 'bb483329f5cfbe1b828a647a9768a7b9ed8dfca7de5a931dcf2f1ceb31c85c0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.3/lambroll_v0.14.3_darwin_amd64.zip'
      sha256 '7bdc4576eddd9746637ce5ca32fc1c432a24c2fff898b305b88052778404d220'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.3/lambroll_v0.14.3_linux_arm64.tar.gz'
      sha256 '71ba65d1c6352f6cad573d3d7776413d550cee309921b0eccc09ad876cb197af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v0.14.3/lambroll_v0.14.3_linux_amd64.tar.gz'
      sha256 '97e4d5cf2521419f54958492a50f8490f651d3291def4693db8eb2ff87bcb96f'
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
