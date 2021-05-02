class TfstateLookup < Formula
  version '0.2.1'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.1/tfstate-lookup_0.2.1_darwin_amd64.tar.gz"
    sha256 '593a5fd2fa53e4af7a8e02b79e7a57a2858f9d1c49b1ace1bd3bca52ad6ba865'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.2.1/tfstate-lookup_0.2.1_linux_amd64.tar.gz"
    sha256 'dfd259a2f5dfec323363d947c61195270f747e7ca10db50eed9e4e7053b63fde'
  end
  head 'https://github.com/fujiwara/tfstate-lookup.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
