class CloudwatchToMackerel < Formula
  version '0.1.0'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  if OS.mac?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.1.0/cloudwatch-to-mackerel_v0.1.0_darwin_amd64.tar.gz"
    sha256 '226bf0aa7ecb42b1a6168345bdbbf76d043782db2aadfa7392bed76b936a28f9'
  end
  if OS.linux?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.1.0/cloudwatch-to-mackerel_v0.1.0_linux_amd64.tar.gz"
    sha256 'be630c4fe4fd718554970cbde78268ffa0a9a42a4a57806cd28c9038b7ccc1c4'
  end
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'cw2mkr'
  end
end
