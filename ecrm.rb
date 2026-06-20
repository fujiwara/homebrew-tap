class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.7.2'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.2/ecrm_0.7.2_darwin_arm64.tar.gz'
      sha256 'b9fe25ef789ecdf07bf66c45d12d856115241039c5fa2da4fb6c0a31b6c26ca2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.2/ecrm_0.7.2_darwin_amd64.tar.gz'
      sha256 '0d8a272f436b7eeadd9fbcb07d87559c8a5a12f139dea525ae16729d70278cc0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.2/ecrm_0.7.2_linux_arm64.tar.gz'
      sha256 '37b0108bebb0f50a6fecc983544497d300818ad76bcbd01c8ce95635a592ad9c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.7.2/ecrm_0.7.2_linux_amd64.tar.gz'
      sha256 '425f42caeea4706f7ccdd08d64494496dd1492757b832503210e7f6a7bf725fa'
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
