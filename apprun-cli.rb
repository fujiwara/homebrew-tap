class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.6.0'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.6.0/apprun-cli_v0.6.0_darwin_arm64.tar.gz'
      sha256 '4ca808b9e0d66060f7b8a62085be6fcb1c022712b6c0831aff9bdbce5fac5779'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.6.0/apprun-cli_v0.6.0_darwin_amd64.tar.gz'
      sha256 '8e6f4d89d21486393064186ab57d477f00eecc9a88bcb349229454f2f539bdc5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.6.0/apprun-cli_v0.6.0_linux_arm64.tar.gz'
      sha256 '5eabb667a0ba63027e84839524f181b4dfbc30e95899595f08afdc22c025307d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.6.0/apprun-cli_v0.6.0_linux_amd64.tar.gz'
      sha256 '4a0de9874754adfc5155776c3bd3af2e320f90db720af306fea60046dc4684c4'
    end
  end

  head do
    url 'https://github.com/fujiwara/apprun-cli.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'apprun-cli'
  end
end
