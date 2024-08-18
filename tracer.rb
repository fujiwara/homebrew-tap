class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.1.0'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.0/tracer_1.1.0_darwin_arm64.tar.gz'
      sha256 'a355d53c60fb362231308b9a532d4ea016359a7f8f7b29a1223d44596f69406f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.0/tracer_1.1.0_darwin_amd64.tar.gz'
      sha256 'c517f57938658d4ce6cac7e363cf77a702a2fcb7cd67d7ac4394d52a865b4909'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.0/tracer_1.1.0_linux_arm64.tar.gz'
      sha256 '35ba554fb53aa09c86f427c6d5185e42eb75fb8452df8d3f2d4b91963800e008'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.0/tracer_1.1.0_linux_amd64.tar.gz'
      sha256 '9a4362b11e107edcb041fc792387a4e63076bc5dad59bbe87aabaee420bb830a'
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
