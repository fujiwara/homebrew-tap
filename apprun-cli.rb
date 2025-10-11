class ApprunCli < Formula
  desc 'CLI for sakura AppRun'
  version '0.5.2'
  homepage 'https://github.com/fujiwara/apprun-cli'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.2/apprun-cli_v0.5.2_darwin_arm64.tar.gz'
      sha256 'd9452f5f22c041872753d5722da30bd218a4a2c8febca0767a82077dfdfb72d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.2/apprun-cli_v0.5.2_darwin_amd64.tar.gz'
      sha256 'da00ad86aa4e85ab19550d0899b78a7cef75f304eb8db326b416ba538d156868'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.2/apprun-cli_v0.5.2_linux_arm64.tar.gz'
      sha256 '552a6c8db4bb97378fffe4713bfae77f5cb2c12a23488d1c41514b7ebc16f727'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/apprun-cli/releases/download/v0.5.2/apprun-cli_v0.5.2_linux_amd64.tar.gz'
      sha256 '2fe6041642311fc9253422ee93d5ec7801d215eeb9375a14e104d5f9a6786594'
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
