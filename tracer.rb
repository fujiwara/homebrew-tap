class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.1.1'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.1/tracer_1.1.1_darwin_arm64.tar.gz'
      sha256 '6c48c29a1a5b393f17554a7137e93ca54e8d1f297fa17b75436d9e272d22d27f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.1/tracer_1.1.1_darwin_amd64.tar.gz'
      sha256 '17a21263ec852a7e4b6331c871c53e12bce2406b4b04c407f6046893e1c84a82'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.1/tracer_1.1.1_linux_arm64.tar.gz'
      sha256 'f1d8b908ba80a567099fea86110f761ce8ec6609151ca207d516815e6d0aa334'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.1/tracer_1.1.1_linux_amd64.tar.gz'
      sha256 '79d04061dc355b47e0004d252e5d2231588f7e9627c5eee1799c6bd671f110ed'
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
