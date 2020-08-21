class CloudwatchToMackerel < Formula
  version '0.0.4'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  if OS.mac?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.4/cloudwatch-to-mackerel_v0.0.4_darwin_amd64.zip"
    sha256 '6a1099a0ccfad14ac404f2eec6547b126dd7131e5fa70618178481f59170b877'
  end
  if OS.linux?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.4/cloudwatch-to-mackerel_v0.0.4_linux_amd64.tar.gz"
    sha256 'd7801fab8fc8f0de811aeaab51294c874ce4395ea0cfc6d7e7f3319dc756703b'
  end
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'cw2mkr'
  end
end
