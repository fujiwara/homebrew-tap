class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.3.3'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.3.3/ecrm_0.3.3_darwin_arm64.tar.gz'
      sha256 '12d6120cc12c280562e1c15a0d1e0c0997a0c0fca114d867f475dac9a557f854'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.3.3/ecrm_0.3.3_darwin_amd64.tar.gz'
      sha256 '2d0c77ae23a4e0a09e8821c61489028c25e7b68fd8765a68457aa02780db929e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.3.3/ecrm_0.3.3_linux_arm64.tar.gz'
      sha256 'a19cbd222a4c5e3450d0289214fea77fd25e3fb9bcabc2f866aa86c77b30ae22'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.3.3/ecrm_0.3.3_linux_amd64.tar.gz'
      sha256 'e1a831f43a7110475151c36bd03364001d4b1f3ad12138c3b36c42e2f020dd8f'
    end
  end

  head do
    url 'https://github.com/fujiwara/ecrm.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecrm'
  end
end
