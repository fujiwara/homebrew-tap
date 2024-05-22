class AwsSdkClientGo < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.0.13'
  homepage 'https://github.com/fujiwara/aws-sdk-client-go'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.13/aws-sdk-client-go_0.0.13_darwin_arm64.tar.gz'
      sha256 '56299e36149d90a541d92a6d75b09378b4caaa4231a9559719ccdcaaefed5114'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.13/aws-sdk-client-go_0.0.13_darwin_amd64.tar.gz'
      sha256 '4a874a01da475e802c5f7c6ce7254f60393ae52e15122255cc31f12e96194f52'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.13/aws-sdk-client-go_0.0.13_linux_arm64.tar.gz'
      sha256 '342de0a4d1fc8497d837adbfd05b256d6fba4ea95ce970d98d096f0e9425c3fa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.13/aws-sdk-client-go_0.0.13_linux_amd64.tar.gz'
      sha256 '9be44670892f34d87c99fc577c0aa8f59aec68b1bcb98ede24892aac75793b15'
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
