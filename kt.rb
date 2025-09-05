class Kt < Formula
  desc 'Kafka command line tool that likes JSON'
  version '15.1.4'
  homepage 'https://github.com/fujiwara/kt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.4/kt_15.1.4_darwin_arm64.tar.gz'
      sha256 '46be453f42bc6816b6c11077f18cfd8082456f77ccb3c35efa46d80b97a96abd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.4/kt_15.1.4_darwin_amd64.tar.gz'
      sha256 '0aace5c24dc918ee71b04ca27e7bab561eb54482be7b49ef7282893c74b95b37'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.4/kt_15.1.4_linux_arm64.tar.gz'
      sha256 '4d3afecab356335ed79beb30c674fd34a3f9c631f7f2088c1d8d12f9b5ebc508'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v15.1.4/kt_15.1.4_linux_amd64.tar.gz'
      sha256 '5da07bda8ec437ce6fffd3bb2706d8c7da0ce0dd0922916b44e85817da644c15'
    end
  end

  head do
    url 'https://github.com/fujiwara/kt.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kt'
  end
end
