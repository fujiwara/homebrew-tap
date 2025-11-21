class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.7.1'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.1/ecrm_0.7.1_darwin_arm64.tar.gz'
      sha256 '2439b1c78e86b5e1c898cc492d6c17aa536fd5271f1072a1f0bc58e0022ae8cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.1/ecrm_0.7.1_darwin_amd64.tar.gz'
      sha256 'b275d9c3cf822ef5ce8ae99c0b1a8a563bb0a032e58ea811c338abeb2b13b61c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.1/ecrm_0.7.1_linux_arm64.tar.gz'
      sha256 '0161494de8edc078584872ae4f7b38508a1a614029322c09838258c3b96cab6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.1/ecrm_0.7.1_linux_amd64.tar.gz'
      sha256 'ce73ba90f7fdd72191a6d3858b7e67f3422104cfb2c3dd0a36313259073c46cb'
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
