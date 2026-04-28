class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.8.2'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.2/ecsta_0.8.2_darwin_arm64.tar.gz'
      sha256 'e54e45b293aa590b74ec2131fa264ccf0e1c6d616d9b328fa7198402d1f8b8fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.2/ecsta_0.8.2_darwin_amd64.tar.gz'
      sha256 '99330735556263e2180d35a44ac672b43160fe030d37c23aee60dbac0bdf3f7c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.2/ecsta_0.8.2_linux_arm64.tar.gz'
      sha256 'e859fb3b04e1b7f95e72a14ab685c33a84efec34e2e05f232cf4bcd4cca8f77d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.2/ecsta_0.8.2_linux_amd64.tar.gz'
      sha256 'c7e7a6d926e2449748459dc5c902177134d9fcea1f05c0c013d31462dda60a9d'
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
