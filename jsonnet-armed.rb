class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.4'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.4/jsonnet-armed_0.0.4_darwin_arm64.tar.gz'
      sha256 '7406c7c2133a7667849e5671058dab438ff052c59bdb17018f03d7ed408353e1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.4/jsonnet-armed_0.0.4_darwin_amd64.tar.gz'
      sha256 '9b9a28f3a66ccbdabce2947c8f3b6e1dd9b85c125c446f1ceff992c1ffad338c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.4/jsonnet-armed_0.0.4_linux_arm64.tar.gz'
      sha256 '7f8ce822114c33906a45ff267e045e4a770b4e7c7480bd8a3c4450ef22b369ab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.4/jsonnet-armed_0.0.4_linux_amd64.tar.gz'
      sha256 '895ad24420d42a8f34b2be007dd9d4bd42bbd99e2821d7cad2e3fa4eb9542dd5'
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
