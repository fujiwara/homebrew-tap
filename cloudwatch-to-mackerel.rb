class CloudwatchToMackerel < Formula
  version '0.1.2'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  if OS.mac?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.1.2/cloudwatch-to-mackerel_v0.1.2_darwin_amd64.tar.gz"
    sha256 'bd8627db23659bfb7dc48621d8fe550633416e5d899ce66568fa073750506822'
  end
  if OS.linux?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.1.2/cloudwatch-to-mackerel_v0.1.2_linux_amd64.tar.gz"
    sha256 '98498f3d749f535113a64a465c9b7ac2bb833f319307a3ded2c79b06e6276c49'
  end
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'cw2mkr'
  end
end
