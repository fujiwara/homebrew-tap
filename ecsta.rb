class Ecsta < Formula
  desc 'ECS Task Assistant tool.'
  version '0.6.2'
  homepage 'https://github.com/fujiwara/ecsta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.2/ecsta_0.6.2_darwin_arm64.tar.gz'
      sha256 '7014f80a49c301685268e873a86bf043604317587c14ffa006c732c26db68e31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.2/ecsta_0.6.2_darwin_amd64.tar.gz'
      sha256 '86e01cfd29662a57f36c2f5c1ce77c6b53316d184442b3e6379294a83966d86c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.2/ecsta_0.6.2_linux_arm64.tar.gz'
      sha256 'f0b398d2d8aced327acffbfecc2a678741de168c3a01b23886218e1eebea4d0c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecsta/releases/download/v0.6.2/ecsta_0.6.2_linux_amd64.tar.gz'
      sha256 '892d8d84e9d4eb7f77852a8c353377af342a481b4c66eeb5338c35449c80faac'
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
