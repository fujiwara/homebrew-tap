class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.4.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.0/awslim_0.4.0_darwin_arm64.tar.gz'
      sha256 'aeffe7943182872077d8bf37d15c50498c1cc44ab58af073cdcfeebced547ff6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.0/awslim_0.4.0_darwin_amd64.tar.gz'
      sha256 '2f1cac2f725d2056a8af44247b7f4bf03bc0a617975ded107595b9a61a31fe8b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.0/awslim_0.4.0_linux_arm64.tar.gz'
      sha256 'a2c78305e45564c9fbca1e28dab2817b8586c36ffde34912f6b20d8376b116a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.4.0/awslim_0.4.0_linux_amd64.tar.gz'
      sha256 'c101612d00e360623b18c5b179cfc3cfa5fe5fdabe579bc0b00157425740316b'
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
