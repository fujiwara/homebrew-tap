class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.1.2'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.2/awslim_0.1.2_darwin_arm64.tar.gz'
      sha256 'b59cee49f3453110f0dc7fba2e2f37655f6954db5393ac39c32a2b6690bcf312'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.2/awslim_0.1.2_darwin_amd64.tar.gz'
      sha256 '22bcaaea7b556068caff29fa8c0b3d6eb85da889b7e793b97435a9dfbe432349'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.2/awslim_0.1.2_linux_arm64.tar.gz'
      sha256 '17fd3f5a4625847b4eb68ca9a478d4afaf8e51e7c38670f5b0aecd63d0a31b6d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.1.2/awslim_0.1.2_linux_amd64.tar.gz'
      sha256 '29b571e6ca7c4a888f7f3bf5cc17f4d184e80b0d9bd969b69320d4f1daec1cdb'
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
