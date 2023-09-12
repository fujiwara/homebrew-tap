class CloudwatchToMackerel < Formula
  version '0.0.5'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  if OS.mac?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.5/cloudwatch-to-mackerel_v0.0.5_darwin_amd64.zip"
    sha256 '4e7c4df0f78cf79e14f2d3b4cf1e0afc9565cb1fc597cc8aff4b29280c8dd633'
  end
  if OS.linux?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.5/cloudwatch-to-mackerel_v0.0.5_linux_amd64.tar.gz"
    sha256 '758c814fc9ab5af8a4cd44f3faa430e7ca33c67d8b7bd3e5eeadf23026de5aaf'
  end
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'cw2mkr'
  end
end
