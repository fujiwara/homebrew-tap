class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.5'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.5/awslim_0.3.5_darwin_arm64.tar.gz'
      sha256 'fac1ad44d596a29a089f19614b90f3021161fe4115a5662d80fd8f9c30652efa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.5/awslim_0.3.5_darwin_amd64.tar.gz'
      sha256 'fd65ca4a5465685e21b240cbac7f39da4a2e6b836148f2d45ee021c890b840f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.5/awslim_0.3.5_linux_arm64.tar.gz'
      sha256 '54c5e371f728ea3f19102155a209fec26affc05c6aac93f8f580abc73b63b462'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.5/awslim_0.3.5_linux_amd64.tar.gz'
      sha256 'a4681112a0db27d99026649d782cdc2a32acc117da3270ef755bb74062d43c67'
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
