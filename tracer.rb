class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.1.2'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.2/tracer_1.1.2_darwin_arm64.tar.gz'
      sha256 '2ad7fa4a4d160137dbeb2e4d010feebdbc4db6d4056b5f7007435b7aa880c503'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.2/tracer_1.1.2_darwin_amd64.tar.gz'
      sha256 'b5973003ca7610c20458b6194ef3f6d39c081326a0a9c43125e30146c968ea5a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.2/tracer_1.1.2_linux_arm64.tar.gz'
      sha256 '20ee352c47a0cb699016cf98133751bf4785adbd2cb0890bb03a40793e819d41'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.1.2/tracer_1.1.2_linux_amd64.tar.gz'
      sha256 '9655512ca41d39208f0290a966359b62b710092c5b0a2a90b25a5886cafc1f8c'
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
