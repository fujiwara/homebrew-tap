class AwsSdkClientGo < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.0.14'
  homepage 'https://github.com/fujiwara/aws-sdk-client-go'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.14/aws-sdk-client-go_0.0.14_darwin_arm64.tar.gz'
      sha256 'f1632c76d525d2978aaa17b30fd590ab29f2e75ea0fd18138458a92346597933'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.14/aws-sdk-client-go_0.0.14_darwin_amd64.tar.gz'
      sha256 '40f8c4bd1e4625639ae9b015abd8c29c406ffdcb46aacec63da64ffdc9d0c8e0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.14/aws-sdk-client-go_0.0.14_linux_arm64.tar.gz'
      sha256 'c5c4355115ed88b3df64ffd9e105ee32276eef061348469527d2cd321d82b817'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.14/aws-sdk-client-go_0.0.14_linux_amd64.tar.gz'
      sha256 'ada48cbcf4066f60d0924163b4556fc9fe0b1f86104e9e2d41d76c79c2ce1488'
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
