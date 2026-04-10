class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.7.2'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.2/mqsubscriber_v0.7.2_darwin_arm64.tar.gz'
      sha256 'fd5211d907d3b48e7ca208d4b9520703fa346c7dbfb983bf770d5bd311bb57bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.2/mqsubscriber_v0.7.2_darwin_amd64.tar.gz'
      sha256 '2763e3e422050bbc70c0837979bc6bde01e836ebc7da9632f124e5c983d9a299'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.2/mqsubscriber_v0.7.2_linux_arm64.tar.gz'
      sha256 '49eb874016ade935171a66d2814a99e685f7c0dbddaf726102b4177ea49d1c11'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.2/mqsubscriber_v0.7.2_linux_amd64.tar.gz'
      sha256 '82f23a9fea37f783b5f7ad9055290ed549dcbb356215c97126ae98ab2c846c80'
    end
  end

  head do
    url 'https://github.com/fujiwara/mqsubscriber.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mqsubscriber'
  end

  test do
    system "#{bin}/mqsubscriber", '-h'
  end
end
