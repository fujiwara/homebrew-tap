class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.7.0'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.0/ecrm_0.7.0_darwin_arm64.tar.gz'
      sha256 'ba0e0eef7b89fd925aba71653d34790ee092ecadbdd56106d5ca9e561afbc275'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.0/ecrm_0.7.0_darwin_amd64.tar.gz'
      sha256 'a3c13145e20a355b6575f923b4cfc3e90942591d0c892134490af7dcfb82ed4d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.0/ecrm_0.7.0_linux_arm64.tar.gz'
      sha256 'e83168aa4aa4c1e800fca7d6b0e18f347c6a55e14be355ae0dad6d24e3f677db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.0/ecrm_0.7.0_linux_amd64.tar.gz'
      sha256 'da93ec1b3a04fdff73bd14cf9d907a5ae113592abb0e25d3b6496b27cab04002'
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
