class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.0.0'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.0/tracer_1.0.0_darwin_arm64.tar.gz'
      sha256 '9c83b11215f8c5e6f12f933163b4f1e9b80c85c1736b90f70152c6c7fcbd7c64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.0/tracer_1.0.0_darwin_amd64.tar.gz'
      sha256 'd86581fe8714de882a4869113191dd7ae1602aea331579f61fc1ec6192c6c0fd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.0/tracer_1.0.0_linux_arm64.tar.gz'
      sha256 '235d5a67f82bd160e4d2452740777f41807a0ec4851179b2b324df4d683b5de3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.0/tracer_1.0.0_linux_amd64.tar.gz'
      sha256 'c84aad622ffae635419282cd5258a6eba572be83482025b9829345eb42da8c77'
    end
  end

  head do
    url 'https://github.com/fujiwara/tracer.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tracer'
  end
end
