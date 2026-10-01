class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.8.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.8.0/awslim_0.8.0_darwin_arm64.tar.gz'
      sha256 '1c2ac885e161ebc75fc78e114ddd1f416ba37f5984d6c5e22bc2539fd18418fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.8.0/awslim_0.8.0_darwin_amd64.tar.gz'
      sha256 '1c6a4230668933c53fa2f4cd9ab836577520beb06a62be89b8b107e75136f245'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.8.0/awslim_0.8.0_linux_arm64.tar.gz'
      sha256 '4a80fb961731561ef9f486b51c1ae21d23d75fb88a032f64a6148f331e109fd4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.8.0/awslim_0.8.0_linux_amd64.tar.gz'
      sha256 'b274d03091f3d4bde91575a7c64827192baba61df92106ba1cedf05b9ed064dc'
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
