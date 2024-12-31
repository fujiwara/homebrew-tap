class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.0.1'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.1/apprun-cli_0.0.1_darwin_arm64.tar.gz'
      sha256 '4622f90775d87b78a27edfb963424a2a78f562211ef63d59e4bb6a1d5669ae04'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.1/apprun-cli_0.0.1_darwin_amd64.tar.gz'
      sha256 'b44413e0e69dccd4cc8450d4bc741e5b30e2b3e65de8e0b655c16a69758d654f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.1/apprun-cli_0.0.1_linux_arm64.tar.gz'
      sha256 '1c9d234924b2b1478ce70e1a45bec27495dfbc34c29827882655464274018867'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.0.1/apprun-cli_0.0.1_linux_amd64.tar.gz'
      sha256 '608b1ac31f950cac240999a56fbf3f6a4ef699844e1eec23e3e7eff989621be6'
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
