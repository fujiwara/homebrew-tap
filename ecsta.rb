class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.2.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.1/ecsta_0.2.1_darwin_arm64.tar.gz'
      sha256 '2788bd9d8cf2caf227cdcdba462b64e484870c333d5e1e3f36684d8edc2690cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.1/ecsta_0.2.1_darwin_amd64.tar.gz'
      sha256 '284c4f1d6a0ab84bb6be028550b6baf4bc0472a2af27e8b701571fc646d74dc7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.1/ecsta_0.2.1_linux_arm64.tar.gz'
      sha256 '9cf5203b3d22da199ddc67d400334461f360b1d10e29f01651ff412f0dcc1237'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.1/ecsta_0.2.1_linux_amd64.tar.gz'
      sha256 'a5ea3b3bb67411f19955accb5f1d9612332033bd38ea30f502d107a24672d42f'
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
