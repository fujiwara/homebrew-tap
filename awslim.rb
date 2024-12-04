class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.10'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.10/awslim_0.3.10_darwin_arm64.tar.gz'
      sha256 'd76db33d247cf49ceb58331bbc873e4ecb7c6ceb7383efb78b53e2066c77dbb3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.10/awslim_0.3.10_darwin_amd64.tar.gz'
      sha256 '6df33a51ac7c5facc78a9b9865ba8ee36a4d5d74fde39c2c52fcc271fed45446'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.10/awslim_0.3.10_linux_arm64.tar.gz'
      sha256 '945dae6ecc314715bb2e927e2dde5cbf18512704e1e2b48f44f1172cee03a43f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.10/awslim_0.3.10_linux_amd64.tar.gz'
      sha256 '9801a196769ad84e410b6602085bd1340b37f608c726d6c12cd9de705e2cc209'
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
