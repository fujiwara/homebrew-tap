class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.2.0'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.0/ecsta_0.2.0_darwin_arm64.tar.gz'
      sha256 '61d97e150bc987ead8e290d7e980e6bd368c8b11699945cfc5c37ef0e502457d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.0/ecsta_0.2.0_darwin_amd64.tar.gz'
      sha256 '34664355913644f17e6df95a03a9f634d2522a0b51975f5ae964c38f171f5197'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.0/ecsta_0.2.0_linux_arm64.tar.gz'
      sha256 '13b25e43b258e8cfac9002097cdd03d438c1ab16e96e3e7848db4b632d69cecb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.0/ecsta_0.2.0_linux_amd64.tar.gz'
      sha256 '07c6c0b67d16c2a48b149f5a58addb16f1da5075df362f02f2a23e250714f3bd'
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
