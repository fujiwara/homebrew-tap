class CloudwatchToMackerel < Formula
  version '0.0.6'
  homepage 'https://github.com/fujiwara/cloudwatch-to-mackerel'
  if OS.mac?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.6/cloudwatch-to-mackerel_v0.0.6_darwin_amd64.zip"
    sha256 'c620e5f6a4b05fca0b790492b5d94889e7b276252602124d72ede68aa81535ad'
  end
  if OS.linux?
    url "https://github.com/fujiwara/cloudwatch-to-mackerel/releases/download/v0.0.6/cloudwatch-to-mackerel_v0.0.6_linux_amd64.tar.gz"
    sha256 '06735c56f2376fa430a1c4fc7c833981ca260ebeb8b11d3289adc8742da14cdd'
  end
  head 'https://github.com/fujiwara/cloudwatch-to-mackerel.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'cw2mkr'
  end
end
