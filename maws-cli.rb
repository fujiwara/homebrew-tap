class MawsCli < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/maws-cli'
  if OS.mac?
    url "https://github.com/fujiwara/maws-cli/releases/download/v0.0.4/maws-cli_0.0.4_darwin_amd64.tar.gz"
    sha256 'f2aa8f6f575b156a014d838a7edaa99124ca0b4d40e7af8af2f015da7c0305d8'
  end
  if OS.linux?
    url "https://github.com/fujiwara/maws-cli/releases/download/v0.0.4/maws-cli_0.0.4_linux_amd64.tar.gz"
    sha256 'a771be53fa0a17713b55e7393a1d3e0edb7ca79c08fc1181042d1c1294a584a5'
  end
  head 'https://github.com/fujiwara/maws-cli.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maws'
  end
end
