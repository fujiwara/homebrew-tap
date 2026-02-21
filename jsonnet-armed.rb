class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.0/jsonnet-armed_0.1.0_darwin_arm64.tar.gz'
      sha256 'f848c8cd8492a4fda82cab24669e3b95bf88d7ba38a58e5b8e230713dee0c341'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.0/jsonnet-armed_0.1.0_darwin_amd64.tar.gz'
      sha256 '45abd0eca31a4b6ebe71f69b22a98110f8f37c00a3053cc43e9216e3d068e5e2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.0/jsonnet-armed_0.1.0_linux_arm64.tar.gz'
      sha256 '7013567ba88f03e8b87ee8c9236925e6fa09e199c38c11886f50c4bd2625f419'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.1.0/jsonnet-armed_0.1.0_linux_amd64.tar.gz'
      sha256 '8987ad15a7597d07b4fb8f6397d14c684d33642e7e481eea90234bb01d6c00e7'
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
