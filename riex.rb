class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.4'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.4/riex_0.0.4_darwin_arm64.tar.gz'
      sha256 '4b9e5676fad5f048161e591c786d3c9b01ab9d83caa6739d91e5709ba3bf5b68'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.4/riex_0.0.4_darwin_amd64.tar.gz'
      sha256 '9b808b2fcd06a370f3ceb7c7019ba5c6de19e417e5868fe227c3e5028ff24884'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.4/riex_0.0.4_linux_arm64.tar.gz'
      sha256 '47efb68bcfa37fd8959c57d5032cec6dda4a88f9167ee40433e013a271f3a067'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.4/riex_0.0.4_linux_amd64.tar.gz'
      sha256 'e2f21406acb50f41150d87a2795fe6071eb06e3a3e1093bdffb4b351e0f6107b'
    end
  end

  head do
    url 'https://github.com/fujiwara/riex.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'riex'
  end
end
