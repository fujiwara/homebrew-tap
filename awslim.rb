class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.0/awslim_0.1.0_darwin_arm64.tar.gz'
      sha256 '12b925f7208600ab3d3d1767cb9e8af164a852cff689b8667120cdb2f8ebeb2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.0/awslim_0.1.0_darwin_amd64.tar.gz'
      sha256 '3c3377b13de40b0e9a9fb54a55696fe0b7f9f2490ba403267cff2aca6bddb2d7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.0/awslim_0.1.0_linux_arm64.tar.gz'
      sha256 'a9b60669a3697278f2e3369354874cc38c37e9bb020f575cc761d8c4281495c3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.0/awslim_0.1.0_linux_amd64.tar.gz'
      sha256 '91568fe42005b0585dbea28108377476c3122490061682bf6aafedf382c2284c'
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
