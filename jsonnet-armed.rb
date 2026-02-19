class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.14'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.14/jsonnet-armed_0.0.14_darwin_arm64.tar.gz'
      sha256 '7658b41e581e4cf9b733e1b7e83e238d6b46befe096022f56739e78b86d1db76'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.14/jsonnet-armed_0.0.14_darwin_amd64.tar.gz'
      sha256 'aa72ed10f4d5fd353aa3cc56b3f854645ff691ce12dc2091a46749220a694bde'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.14/jsonnet-armed_0.0.14_linux_arm64.tar.gz'
      sha256 '222fd3bee781d87d6d26f6f3ab9a89dde1ca5e7f596fe45cffc4782a74bfb1fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.14/jsonnet-armed_0.0.14_linux_amd64.tar.gz'
      sha256 '2e4812aa420986eed0d709bee3c54476f81a188792e6c03e951b2c7ff6f295b3'
    end
  end

  head do
    url 'https://github.com/fujiwara/jsonnet-armed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'jsonnet-armed'
  end
end
