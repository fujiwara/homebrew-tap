class SimplemqCli < Formula
  version '0.7.0'
  homepage 'https://github.com/fujiwara/simplemq-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-localserver_0.7.0_darwin_arm64.tar.gz'
      sha256 '8f9a0b4091e972575a7fb47e89d8fba1e6117d090551957ada7bdffd508b68ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-localserver_0.7.0_darwin_amd64.tar.gz'
      sha256 '500b1c0ccc0c8841163c010608ffa7109a1c8daedf1a1daa2ed3845f860ab974'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-localserver_0.7.0_linux_arm64.tar.gz'
      sha256 '3092660f23df4b4a619285a05d0aad0e9ac8ddd5f33c5d10d5520c22af63282c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/simplemq-cli/releases/download/v0.7.0/simplemq-localserver_0.7.0_linux_amd64.tar.gz'
      sha256 '2f1a95240f715e31e002152ea8b51d0d262c9bde0616898ec33158a1fb6f7c39'
    end
  end

  head do
    url 'https://github.com/fujiwara/simplemq-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'simplemq-cli'
  end
end
