class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.7.0'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.0/ecsta_0.7.0_darwin_arm64.tar.gz'
      sha256 '7a4e880056684ba1642b04129a1a945ea8680ad2c4b53cdefe9fa2fd2e412e41'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.0/ecsta_0.7.0_darwin_amd64.tar.gz'
      sha256 '20f63f35b628bfb2e8a20b7081f8f2badabdcce241c391b030c09329ca63ffd7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.0/ecsta_0.7.0_linux_arm64.tar.gz'
      sha256 'e7634f8171c407501e7a6c5d6fca23acf99867b9319be0b6686c96f05655aad0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.0/ecsta_0.7.0_linux_amd64.tar.gz'
      sha256 '30abfd39d02c78774a2b47eee0a89aadc3a06e01deadff7fdc9abccb56576702'
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
