class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.11'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.11/jsonnet-armed_0.0.11_darwin_arm64.tar.gz'
      sha256 '3d5bb7fd7728ca4887cbaf5c05562131d3b39fb5bb47b30dc90a4df504590095'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.11/jsonnet-armed_0.0.11_darwin_amd64.tar.gz'
      sha256 'a50a6759eadafaeaa484ca6e4b47d6e1b653daa57a250c1b825124bae7395b27'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.11/jsonnet-armed_0.0.11_linux_arm64.tar.gz'
      sha256 'a9dd6ae1ba1484abeb20c3f1f31d72f1ad9765ba87802c37203c95fdb86b3a7f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.11/jsonnet-armed_0.0.11_linux_amd64.tar.gz'
      sha256 'ec21cbb84f657d94ef745fcb806f57b018a3de3b9d09aa774a83015f6204b618'
    end
  end

  head do
    url 'https://github.com/fujiwara/jsonnet-armed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'jsonnet-armed'
  end
end
