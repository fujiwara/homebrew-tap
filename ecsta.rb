class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.3.1'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.1/ecsta_0.3.1_darwin_arm64.tar.gz'
      sha256 '9779a80a1afb16e05480dd540f2995156b7c970a5b8516d2292a8855c5367d58'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.1/ecsta_0.3.1_darwin_amd64.tar.gz'
      sha256 '88db91116eeb539eede4067104e72bc4766185933e4d54090ac6c82bf151874b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.1/ecsta_0.3.1_linux_arm64.tar.gz'
      sha256 '69ff0d02083bb5923928709bf8aea7c8a963f5d76b7c1f0c99f844a3937a84ab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.3.1/ecsta_0.3.1_linux_amd64.tar.gz'
      sha256 'a4395b863722ac3001295334597ef83884edc5e413ea7f68b741b1591c8750d2'
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
