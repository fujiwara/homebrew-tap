class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.3.7'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.7/awslim_0.3.7_darwin_arm64.tar.gz'
      sha256 '430f8c0dd8bfdd1e8b719b91b7a42d8e3943e3dc1854898514fa6ddd6aefb89d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.7/awslim_0.3.7_darwin_amd64.tar.gz'
      sha256 '6fcf75529818a48cecd66febcfb78aa1f41555b178546afdbd565e155c728793'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.7/awslim_0.3.7_linux_arm64.tar.gz'
      sha256 '8230c8bcc77b7f51fe4567c7eb838b6705dd63ba8afcdebb9ee729ce61dbbd5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.3.7/awslim_0.3.7_linux_amd64.tar.gz'
      sha256 'ec5665f1e0b37974d68aa8350ba8f2723c69975f0d392b0571fd14502db71de0'
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
