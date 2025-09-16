class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.7'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.7/jsonnet-armed_0.0.7_darwin_arm64.tar.gz'
      sha256 '45c4ffe91a3149af289840ea73d0ce986db7c3cabde3372d42a6cf737ded9ccb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.7/jsonnet-armed_0.0.7_darwin_amd64.tar.gz'
      sha256 '3dfe56a793763a3b47122bda8086a5a83920914def6a17bc4163cde48a239f70'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.7/jsonnet-armed_0.0.7_linux_arm64.tar.gz'
      sha256 'f27bd9c4cb58e676639758ca5dab44b47c95c72000f6227bf251d894d2f810fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.7/jsonnet-armed_0.0.7_linux_amd64.tar.gz'
      sha256 '33959c9cc5c5d2a37bd5911775a080d019a54dd9392072006de3c704a688e40b'
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
