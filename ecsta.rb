class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.8.0'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.0/ecsta_0.8.0_darwin_arm64.tar.gz'
      sha256 '966c479757ba474d4ed29dc362a5e7a2afccba73dd58444ea1e59a6fbcf36c03'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.0/ecsta_0.8.0_darwin_amd64.tar.gz'
      sha256 'dad7a790d3ba08d98d2438372d3aa4767dd65a8857a6c6e9f4e46deb48f48ba6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.0/ecsta_0.8.0_linux_arm64.tar.gz'
      sha256 '74842e24dfd289ee8a6a2344021d47a1223baa90130217618674828edcabf98f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.8.0/ecsta_0.8.0_linux_amd64.tar.gz'
      sha256 '5ebca3f4304a38a6805f92159742cd8b6fab60babf132e6024a0ac981e8ffdfa'
    end
  end

  head do
    url 'https://github.com/fujiwara/ecsta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
