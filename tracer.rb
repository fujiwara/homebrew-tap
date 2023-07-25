class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.0.2'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.2/tracer_1.0.2_darwin_arm64.tar.gz'
      sha256 '6aa52a95eaf176c6f4a11e0be0567ecaeec67ac8a02b7098e43427296248ad35'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.2/tracer_1.0.2_darwin_amd64.tar.gz'
      sha256 '0fe8866c2c469153d59218af052c0726d3ca20fac70095c26d10d1957bc0ade6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.2/tracer_1.0.2_linux_arm64.tar.gz'
      sha256 '26e04a1bf5f21c4ba78eccef076dbcbd467b04576a485de811445594821e5e99'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.2/tracer_1.0.2_linux_amd64.tar.gz'
      sha256 '89402cb97d358e1d5d3e3cd0ad9ed68d634bb04e15f57747e0f42061a0a9893f'
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
