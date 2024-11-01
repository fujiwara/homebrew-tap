class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.6.0'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.0/ecrm_0.6.0_darwin_arm64.tar.gz'
      sha256 '3959f896018804fca27184ae299bb1fb07f017f05680cddfe038198688983c0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.0/ecrm_0.6.0_darwin_amd64.tar.gz'
      sha256 '99e4c324a6f5b4108712edf8171cc1b1cba001c1aba1ffe7779af8b1b7454d43'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.0/ecrm_0.6.0_linux_arm64.tar.gz'
      sha256 'c704062209edd3811662e3375aa78be6a49b5724151d79b3ef4c978049ac3950'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.0/ecrm_0.6.0_linux_amd64.tar.gz'
      sha256 '4ae605779c292d79cdb2af7f924afa2ab6ee2cbc8a695a790cb58c7976499784'
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
