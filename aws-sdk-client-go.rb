class AwsSdkClientGo < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.0.10'
  homepage 'https://github.com/fujiwara/aws-sdk-client-go'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.10/aws-sdk-client-go_0.0.10_darwin_arm64.tar.gz'
      sha256 'a8da0046852248145b7f9c1ac3951b23de5cc4b51e1d86d0991bed4705ba6c2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.10/aws-sdk-client-go_0.0.10_darwin_amd64.tar.gz'
      sha256 'd675a9e35f4e8fef676f73f81c2d3efb9cf8666784215e6fc17d352f0d359c25'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.10/aws-sdk-client-go_0.0.10_linux_arm64.tar.gz'
      sha256 '7bd07aae99511248eb6ad750a08b722d225e966184a0f6e90d89ed282df4b17e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.10/aws-sdk-client-go_0.0.10_linux_amd64.tar.gz'
      sha256 'b5c862031fabb0b60b4168b5f8e31c9e819be3a25f3ebf4891d699799f473f85'
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
