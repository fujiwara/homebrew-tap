class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.4.3'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.3/ecsta_0.4.3_darwin_arm64.tar.gz'
      sha256 '0c73730cf92ce6b689d3f514f76b99d57caab012bda9f51e09f5df6f3d1c3964'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.3/ecsta_0.4.3_darwin_amd64.tar.gz'
      sha256 '4318cf82e108838ff122c83ccaa84a3ec5b18cceb71a8a1b07f71d2b6ca20134'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.3/ecsta_0.4.3_linux_arm64.tar.gz'
      sha256 '991acd3113190075405d290fe1e07a8910109cf37d1ae6a8bf6423d730aef36a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.3/ecsta_0.4.3_linux_amd64.tar.gz'
      sha256 '2831e77aaaf7ff745a2c3ad552177b8680d3381dc1def18c5aabe5600f9dcbef'
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
