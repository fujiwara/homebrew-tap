class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.6.1'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.1/ecrm_0.6.1_darwin_arm64.tar.gz'
      sha256 '7cac3fd39e9075cd8cf2eb6088ba8b59423f16b4a872ad62e66382e5bed77497'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.1/ecrm_0.6.1_darwin_amd64.tar.gz'
      sha256 '38d84cff3719bfbb31843919bc0b72327b27cb9eb06b71352f34618ce27aee6d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.1/ecrm_0.6.1_linux_arm64.tar.gz'
      sha256 'ad322464b1d48ae54674ca4af1e87dae2c719c2cecf212d2b03a07ede7121624'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.6.1/ecrm_0.6.1_linux_amd64.tar.gz'
      sha256 'b0de4d6944f83fe3df5a54d101622184191ec983a64685514079893a156b3480'
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
