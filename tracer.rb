class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.1.3'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.3/tracer_1.1.3_darwin_arm64.tar.gz'
      sha256 '4c973d65d4e50e4c30e48a5e084939d27c1efc752f18c36094778695f32176d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.3/tracer_1.1.3_darwin_amd64.tar.gz'
      sha256 '7cbb035cb2ccffb4c86987ef3606daf1f3f1d92e21b15018fc593b80aad79b9f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.3/tracer_1.1.3_linux_arm64.tar.gz'
      sha256 '6b31a43c484e5fd440d6a17683e6a88ab4c35311f3a2f97c9af9c5413ff34a7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.3/tracer_1.1.3_linux_amd64.tar.gz'
      sha256 '35bd6b73ee4e5960274a40792ce701efe25641d9d4addb2a2d4c0332fbf0d8a4'
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
