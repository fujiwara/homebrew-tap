class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.6.0'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.0/ecsta_0.6.0_darwin_arm64.tar.gz'
      sha256 'ebaf59b5fcef7a692c5bfadf46143570ada9304b2309107d0d1f45f1a588cd52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.0/ecsta_0.6.0_darwin_amd64.tar.gz'
      sha256 '00316c9d4903691aa7a0f8ef898054c0160dd65835876c0ea4dc0ffae9f2cb19'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.0/ecsta_0.6.0_linux_arm64.tar.gz'
      sha256 '6201e78a10862491ad580cf14517ab731487a0f3a920fd18d9ade68151a28d21'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.0/ecsta_0.6.0_linux_amd64.tar.gz'
      sha256 'b502d38504a6045aeed064970040100c9099d3f3fc02f334b22457bddef48d5a'
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
