class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.12'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.12/jsonnet-armed_0.0.12_darwin_arm64.tar.gz'
      sha256 '303cf66ee9dcccce91aba030ada629f9c3832885227928824dd681f035a551ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.12/jsonnet-armed_0.0.12_darwin_amd64.tar.gz'
      sha256 '7fb5d8ebe258e7d6229823c117f3bca5401b2c5517a963a00d354072271e251a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.12/jsonnet-armed_0.0.12_linux_arm64.tar.gz'
      sha256 'ec66531c69f613054d25073d819f2c624b1ee63bda81cb6024ca02d84d66de8e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.12/jsonnet-armed_0.0.12_linux_amd64.tar.gz'
      sha256 '579985d6cff10fc537059f79e9770ec88d61fd99eb70f9663bbbf1cc62fc8b35'
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
