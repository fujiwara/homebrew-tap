class Ecsta < Formula
  version '0.0.3'
  homepage 'https://github.com/fujiwara/ecsta'
  if OS.mac?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.3/ecsta_0.0.3_darwin_amd64.tar.gz"
    sha256 'e484a70c3ce28f7fb12ca03f8dfa12cfbe0f8ab9e2e4ab0642eb474fd2c7fc42'
  end
  if OS.linux?
    url "https://github.com/fujiwara/ecsta/releases/download/v0.0.3/ecsta_0.0.3_linux_amd64.tar.gz"
    sha256 '4908fece7a6c3c8807dfc9e5a060cca6499e1b07f839efc066b4d7d0b30434bc'
  end
  head 'https://github.com/fujiwara/ecsta.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecsta'
  end
end
