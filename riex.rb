class Riex < Formula
  desc 'AWS RI expiration detector'
  version '0.0.5'
  homepage 'https://github.com/fujiwara/riex'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.5/riex_0.0.5_darwin_arm64.tar.gz'
      sha256 'f6f4ea0c54cd52cbe3d6e5b769b5a1ecbb4ac3898d2bf1aad7bcbe0a6731cdac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.5/riex_0.0.5_darwin_amd64.tar.gz'
      sha256 '83a50c9bc0dcbd66fb2be6755036531a12fc186474311102d3e4b470dcb89510'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.5/riex_0.0.5_linux_arm64.tar.gz'
      sha256 'b8a2d3c07c3e4f6dc68eb33837e484ff0bc57ab57f23337da08b01a61a2e6df1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/riex/releases/download/v0.0.5/riex_0.0.5_linux_amd64.tar.gz'
      sha256 '0f8b361fd00b4863a89471c54f7e1bb82d7f4823e2dd4dc9df03d8ed632d26dc'
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
