class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.4.0'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.0/ecsta_0.4.0_darwin_arm64.tar.gz'
      sha256 '714c6770672345b72a53ff3b121dc19f8d9cc0e09d1acf63de98185803f54b42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.0/ecsta_0.4.0_darwin_amd64.tar.gz'
      sha256 '9050e1bdc147695736a4c7fd5fe021a106a89da34987427625a9223dd57af219'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.0/ecsta_0.4.0_linux_arm64.tar.gz'
      sha256 '8c354d265976347a794920c46c248f977ee243f0f307271cf410d8aee3f3a2db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.0/ecsta_0.4.0_linux_amd64.tar.gz'
      sha256 '9e85fc948c53734a7ced2dd2c17529698324c4a71538555a4c878254e2bcd17e'
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
