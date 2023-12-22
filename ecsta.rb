class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.4.2'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.2/ecsta_0.4.2_darwin_arm64.tar.gz'
      sha256 '299b0ae1422d80c8f6a08846f957a12d933fe34d91e4bc13a64571d0b81fb3dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.2/ecsta_0.4.2_darwin_amd64.tar.gz'
      sha256 '88d89870a49788714abd76fed01a700998bd57626dec2e7885fdd8e40df41772'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.2/ecsta_0.4.2_linux_arm64.tar.gz'
      sha256 'c25dc72bd6c4cefd37568e94fa0b785634debb145a93c4c91dd083550979665a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.2/ecsta_0.4.2_linux_amd64.tar.gz'
      sha256 '41c220f7403eff7dbf60353ad338c108b59783a76e064ea422e30553aaa4d841'
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
