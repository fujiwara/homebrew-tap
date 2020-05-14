class CloudwatchToMackerel < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.4/cloudwatch-to-mackerel_v0.0.4_darwin_amd64.zip"
  sha256 '6a1099a0ccfad14ac404f2eec6547b126dd7131e5fa70618178481f59170b877'
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  def install
    bin.install 'cw2mkr'
  end
end
