class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.3.0'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.0/ecsta_0.3.0_darwin_arm64.tar.gz'
      sha256 '067f97fe3896d2f0b02f95f17866542dbb6e823345564548535c1fef4072066b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.0/ecsta_0.3.0_darwin_amd64.tar.gz'
      sha256 '3435ee22a189a4f0c4a5230df433e5ac423c4948d00115146cc25da9be4ed3d1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.0/ecsta_0.3.0_linux_arm64.tar.gz'
      sha256 '39e77dc4cf7ea1818412b9969da1ea3374ce98f996aa07a94150fbc169ec7aea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.0/ecsta_0.3.0_linux_amd64.tar.gz'
      sha256 'b6521b0f8e84f0de7b2ac1022c2bfda0e293258de1870af890fad2bd347c8b5b'
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
