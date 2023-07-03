class Tracer < Formula
  desc 'ECS task event/log tracer CLI'
  version '1.0.1'
  homepage 'https://github.com/fujiwara/tracer'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.1/tracer_1.0.1_darwin_arm64.tar.gz'
      sha256 'a4505f6f53f9f727c30e3f905410333963de68829bf99a4c38c3b71df4eed4a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.1/tracer_1.0.1_darwin_amd64.tar.gz'
      sha256 '240d80f0477083bab30a9cdea2efd34f4d935acb5c1e27c90e765d74f4c70ac9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.1/tracer_1.0.1_linux_arm64.tar.gz'
      sha256 'c09e03ad46c6bee26e67882a25687fc0d66977a4906e44814442aeef0a7afd90'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tracer/releases/download/v1.0.1/tracer_1.0.1_linux_amd64.tar.gz'
      sha256 '39fb70ba51d3d97873db490f45c5a8a273fa93d6e760d31d0482291a05e195eb'
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
