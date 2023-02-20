class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.2.2'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.2/ecsta_0.2.2_darwin_arm64.tar.gz'
      sha256 'bcc08db6e8c430b0da5ac02c5640698c9d217fee01a8a83bbeb44405a02161b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.2/ecsta_0.2.2_darwin_amd64.tar.gz'
      sha256 'c4c07dd5f04868a16e5477e4629058f36945ff35ffd929f31fbb555d09e6586c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.2/ecsta_0.2.2_linux_arm64.tar.gz'
      sha256 'a5db39c79c47c97bcd8ee721a3c6320803bb403d9d8b52434a15decb0376b2e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.2.2/ecsta_0.2.2_linux_amd64.tar.gz'
      sha256 '4a1e0b7b464d777a492c690cb37eff97382d36a7d5ee3a8b972ec13b3b4f7269'
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
