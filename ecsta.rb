class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.3.4'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.4/ecsta_0.3.4_darwin_arm64.tar.gz'
      sha256 '0c0734ed840cd24c6df549d8d5a4578b05e5770850588f74d683d1daf997250a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.4/ecsta_0.3.4_darwin_amd64.tar.gz'
      sha256 '75d5bc441285203cf18818e3556c2113c4477ed5dcdf58b88c016c3456475036'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.4/ecsta_0.3.4_linux_arm64.tar.gz'
      sha256 '59a6f4c3425bb78b4ea13cd9bd9f7a7207aabb2e035cc7dac99c96c4ef59823e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.4/ecsta_0.3.4_linux_amd64.tar.gz'
      sha256 '973b0d0539b9406bda9482c8f28ddfb6a35741c4cd8f599d3a2136174a4c8926'
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
