class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.7.3'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.3/ecsta_0.7.3_darwin_arm64.tar.gz'
      sha256 '3f84ec267192d635c7b8de17fdfe69514d532a142da88e825995e749b307cb06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.3/ecsta_0.7.3_darwin_amd64.tar.gz'
      sha256 '190a7c2942dc2148c86e9b55265796e7e59bec94592341805472032c8f36aa1f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.3/ecsta_0.7.3_linux_arm64.tar.gz'
      sha256 '873dfaa6444fb98085138b6e0b97df1bd610aa63bd5b3bb26b5d071539bcb68a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.7.3/ecsta_0.7.3_linux_amd64.tar.gz'
      sha256 'b0592d465dd59a47c19240512746685b24c668033cebd15c76059ee97b6bb044'
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
