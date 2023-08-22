class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.1.3'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.3/tfstate-lookup_1.1.3_darwin_arm64.tar.gz'
      sha256 'd6cb76d8539d6f323b16b99a862e7fb9642170993577e602c589552bc45e8b77'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.3/tfstate-lookup_1.1.3_darwin_amd64.tar.gz'
      sha256 '869c035d14a3e239abc752b0b27cdb5caa5634ec023a07605cce782f641d8718'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.3/tfstate-lookup_1.1.3_linux_arm64.tar.gz'
      sha256 '89327cf95bdf2239cbe97eb00b767f671d993d985dd2498d42f70242b2c296db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.1.3/tfstate-lookup_1.1.3_linux_amd64.tar.gz'
      sha256 'a7c9dc93b9f2cfa2dfff89da425daac4acfcf533ebfc8cde45ce394f3217d3e7'
    end
  end

  head do
    url 'https://github.com/fujiwara/tfstate-lookup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
