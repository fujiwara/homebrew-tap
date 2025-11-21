class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.7.4'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.4/ecsta_0.7.4_darwin_arm64.tar.gz'
      sha256 '7cd1e8062121ad0e0f05a129d0e5644a636d067ccfa54d96291ef5d66ba2da5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.4/ecsta_0.7.4_darwin_amd64.tar.gz'
      sha256 '172941b0e4415dfc69f3bcb551304cb82cfa634aae4bd00adb9729cc63714d95'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.4/ecsta_0.7.4_linux_arm64.tar.gz'
      sha256 '2569ecf4374dfbada6cf74e5c0cfa5e29f0717391f878f626441bb13395c857b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.4/ecsta_0.7.4_linux_amd64.tar.gz'
      sha256 '21b826c21ff3dd851b551cd3c53fbe83e60bd142d07aecf2ee8a0eddab4f0b55'
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
