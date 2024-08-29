class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.4'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.4/awslim_0.3.4_darwin_arm64.tar.gz'
      sha256 'cd932619cbb7dd8b417bd60cc5741d43a728d02e8eb72ee1f9015471f30b4e5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.4/awslim_0.3.4_darwin_amd64.tar.gz'
      sha256 '27248e77ea557ddec167afdcd8c82991782f2349e2e532de46f94fa0aa6dc01c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.4/awslim_0.3.4_linux_arm64.tar.gz'
      sha256 '81405a24060d7c5de009b459ea2bfbf775ee02b68ecbcf59d0f807bad9b023cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.4/awslim_0.3.4_linux_amd64.tar.gz'
      sha256 '6daae1c468b6c852b53339ea0a85384b8c245ad9e2b0e07d81b2867ab4f7dc04'
    end
  end

  head do
    url 'https://github.com/fujiwara/awslim.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'awslim'
  end
end
