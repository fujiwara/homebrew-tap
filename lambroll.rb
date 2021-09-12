class Lambroll < Formula
  version '0.11.8'
  homepage 'https://github.com/fujiwara/lambroll'
  if OS.mac?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.8/lambroll_v0.11.8_darwin_amd64.zip"
    sha256 '2bf536faa1fe5465fbfda7865351790625ad0c084b0df511a282786eb4963732'
  end
  if OS.linux?
    url "https://github.com/fujiwara/lambroll/releases/download/v0.11.8/lambroll_v0.11.8_linux_amd64.tar.gz"
    sha256 'c32e6018bf30c633f657fd226d015f5e372641def6335e2cb7b9365a758dc298'
  end
  head 'https://github.com/fujiwara/lambroll.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'lambroll'
  end
end
