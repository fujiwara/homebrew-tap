class TfstateLookup < Formula
  version '0.1.4'
  homepage 'https://github.com/fujiwara/tfstate-lookup'
  if OS.mac?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.4/tfstate-lookup_0.1.4_darwin_amd64.tar.gz"
    sha256 '25678037706914b03c017f582f85bde3c86cd740908aae9bbdbb6fe131e48a2e'
  end
  if OS.linux?
    url "https://github.com/fujiwara/tfstate-lookup/releases/download/v0.1.4/tfstate-lookup_0.1.4_linux_amd64.tar.gz"
    sha256 'ab2575607ccff4b353b096655a507c3be661e72228bd77339701da38d1ff6fa9'
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
