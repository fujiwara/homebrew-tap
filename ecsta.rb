class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.4.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.1/ecsta_0.4.1_darwin_arm64.tar.gz'
      sha256 '7dd6e840f7f8a9fd1e37346eb2de080fa6c89a15f9b5861d294952a396b806fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.1/ecsta_0.4.1_darwin_amd64.tar.gz'
      sha256 '6347d970d2aeffee43a087eca69152f9a6d453052b9290a0039c3fc405f11148'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.1/ecsta_0.4.1_linux_arm64.tar.gz'
      sha256 '20ffdce4051142601aaeb08efe40e4c8b01876081dcb842fd358905f6c8575ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.1/ecsta_0.4.1_linux_amd64.tar.gz'
      sha256 '1ca0ae438cb87afc515bd3f3dfe638c8792db79dc68b3305f0ecd0b4f3d9c210'
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
