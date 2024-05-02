class CloudwatchToMackerel < Formula
  version '0.1.1'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  if OS.mac?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.1.1/cloudwatch-to-mackerel_v0.1.1_darwin_amd64.tar.gz"
    sha256 '7c49db6a960c4833a4465cd947f43fd4061a7161649f954a09cc838ec0252e5d'
  end
  if OS.linux?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.1.1/cloudwatch-to-mackerel_v0.1.1_linux_amd64.tar.gz"
    sha256 '9b9b4952c0528d567d7af54951bb20a2a57d748abf2e37ad5d0f09c6c3c51300'
  end
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'cw2mkr'
  end
end
