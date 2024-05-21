class AwsSdkClientGo < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.0.12'
  homepage 'https://github.com/fujiwara/aws-sdk-client-go'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.12/aws-sdk-client-go_0.0.12_darwin_arm64.tar.gz'
      sha256 'a347a3114132d1b77e791a733b8747fc3b35e2db055685286b962a683e330eaf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.12/aws-sdk-client-go_0.0.12_darwin_amd64.tar.gz'
      sha256 '3f7c91a5738fe0e68bc612b7d3ae5d2738dc8be5690dfa55380795744bcf1ce0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.12/aws-sdk-client-go_0.0.12_linux_arm64.tar.gz'
      sha256 'c84ef0c5d3c811701b793add6035a53c43392a05a0f8dc0d7e104640ff88225e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/aws-sdk-client-go/releases/download/v0.0.12/aws-sdk-client-go_0.0.12_linux_amd64.tar.gz'
      sha256 'dc2106ca10d3c8c9b924b1256984958f3ca30471d0861b2314256e6fd622c6d6'
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
