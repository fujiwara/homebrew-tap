class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.2.3'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.3/ecsta_0.2.3_darwin_arm64.tar.gz'
      sha256 '66fcbd602a9212b48293206645aa9ec50352222e4333b443b2715ba13145541e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.3/ecsta_0.2.3_darwin_amd64.tar.gz'
      sha256 'f40c6777fc4eab26135b9b87beaabd42279f382431023ed9bf3c79bcc48f645d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.3/ecsta_0.2.3_linux_arm64.tar.gz'
      sha256 '2213263dcb87c28f73af81e0839737b1c9e576c1f7913e7478a00a578fec5749'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.3/ecsta_0.2.3_linux_amd64.tar.gz'
      sha256 '896ad31d6892625b58508991e7acefd73b4a1905e8335582b41b437741695e09'
    end
  end

  head do
    url 'https://github.com/fujiwara/ecsta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
