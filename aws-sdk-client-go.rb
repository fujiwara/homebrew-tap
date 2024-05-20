class AwsSdkClientGo < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.0.11'
  homepage 'https://github.com/fujiwara/aws-sdk-client-go'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.11/aws-sdk-client-go_0.0.11_darwin_arm64.tar.gz'
      sha256 'e5c064b2806d36760b66875821f4e44541bc28f69c4de08f60db2d852a660b26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.11/aws-sdk-client-go_0.0.11_darwin_amd64.tar.gz'
      sha256 'b5f53a3797316e6ee5311505ccd1c2d0ebb0848fca6711035baf2f51f30d08dc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.11/aws-sdk-client-go_0.0.11_linux_arm64.tar.gz'
      sha256 'c95c554054e08feba6d28a971caa36b24f127997fc9a98b60e25555c2b9b3016'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.11/aws-sdk-client-go_0.0.11_linux_amd64.tar.gz'
      sha256 '17eb01de8d2ced1b7f26103463093a470fb611c976122305a33f49eb43e5738b'
    end
  end

  head do
    url 'https://github.com/fujiwara/aws-sdk-client-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'aws-sdk-client-go'
  end
end
