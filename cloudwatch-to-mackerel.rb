class CloudwatchToMackerel < Formula
  version '0.0.1'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.1/cloudwatch-to-mackerel_v0.0.1_darwin_amd64.zip"
  sha256 'a425ffadda63c9ac79b759d75c1478e5ca22c276c7cb0a0fbdb9c660a589c096'
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  def install
    bin.install 'cw2mkr'
  end
end
