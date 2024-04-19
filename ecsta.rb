class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.4.5'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.5/ecsta_0.4.5_darwin_arm64.tar.gz'
      sha256 '4378ec7820750b08d8f71c800d8e59abc44bc5b0430dd73963abf1e9a512222f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.5/ecsta_0.4.5_darwin_amd64.tar.gz'
      sha256 '7a0dfa3051e0caa6e34957e9f8aa55a19991a36c6a5d13ac8f5680035f48058c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.5/ecsta_0.4.5_linux_arm64.tar.gz'
      sha256 '0865cec735ba38e8fef70a67e55357393232b7f19950c740a06d10301ab74e27'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.4.5/ecsta_0.4.5_linux_amd64.tar.gz'
      sha256 'a74ec52534941b7117cc21248228c8bac60cbeecea036e76f31b72129455938c'
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
