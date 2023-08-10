class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.3.5'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.5/ecsta_0.3.5_darwin_arm64.tar.gz'
      sha256 '2bde80774b46339e5dbddd332618d45d13c7cc4152712c58074e0538da3e9574'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.5/ecsta_0.3.5_darwin_amd64.tar.gz'
      sha256 'c481aaa9dacf2a6865abe58c19e4bb38b09c4b2d9a68b7aebe63d35657f782ee'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.5/ecsta_0.3.5_linux_arm64.tar.gz'
      sha256 '3fce14f4f77a7b8391e096f67a0c28560ec08aa5ab9b09379fefce94e3ea17da'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.5/ecsta_0.3.5_linux_amd64.tar.gz'
      sha256 'e8e400eebc451bda1da1921e9abf51fea69d8f9ea6776ab549cbdde812ef729f'
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
