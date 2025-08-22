class Kt < Formula
  desc 'Kafka command line tool that likes JSON'
  version '15.0.0'
  homepage 'https://github.com/fujiwara/kt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kt/releases/download/v15.0.0/kt_15.0.0_darwin_arm64.tar.gz'
      sha256 '2e9089a3a7f647d51edfd7571ed9c2f0966704dfb26af970b72c61017720224d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v15.0.0/kt_15.0.0_darwin_amd64.tar.gz'
      sha256 '7d0953ad34af8de0bb385bd404031f664fd0163f9be2ba26e1448e6bb4b43a05'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kt/releases/download/v15.0.0/kt_15.0.0_linux_arm64.tar.gz'
      sha256 'e3a49284863e423b71155bf8ceaa9cd4b437c2ce60cbd8a7afebe3c9eaaa115a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v15.0.0/kt_15.0.0_linux_amd64.tar.gz'
      sha256 '577387f6445f6a1def3bd30a52ba78de99aad0ee39fefa413ce35b261316259f'
    end
  end

  head do
    url 'https://github.com/fujiwara/kt.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kt'
  end
end
