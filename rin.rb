class Rin < Formula
  version '1.0.1'
  homepage 'https://github.com/fujiwara/rin'
  if OS.mac?
    url "https://github.com/fujiwara/Rin/releases/download/v1.0.1/rin-v1.0.1-darwin-amd64.zip"
    sha256 '231dfdda42e5723d76483597b0c5d1e200fbef8b97260dafe0f67fd0e27de72c'
  end
  if OS.linux?
    url "https://github.com/fujiwara/Rin/releases/download/v1.0.1/rin-v1.0.1-linux-amd64.zip"
    sha256 '9428d050943884579a354282eead7cec5012b79f72eeadd2d0073e214aca183f'
  end
  head 'https://github.com/fujiwara/rin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv rin-v*-*-amd64 rin'
    bin.install 'rin'
  end
end
