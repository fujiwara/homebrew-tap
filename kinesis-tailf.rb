class KinesisTailf < Formula
  desc 'tail -f command for Amazon Kinesis Stream'
  version '0.5.0'
  homepage 'https://github.com/fujiwara/kinesis-tailf'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.0/kinesis-tailf_0.5.0_darwin_arm64.tar.gz'
      sha256 'b98ccea9d7c2a03a351577a8c94ed829d9e7323d9fb4c005268f67e408ed0717'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.0/kinesis-tailf_0.5.0_darwin_amd64.tar.gz'
      sha256 'bde1fa83bd5a3439c2aaa1e0e6f77bb44d6844b09fe32b30f91b505a92b436de'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.0/kinesis-tailf_0.5.0_linux_arm64.tar.gz'
      sha256 '96ecf927be0f784b83d51726cf0c9b3db363df5b62537b53d6cc9a5a76a9a48c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.0/kinesis-tailf_0.5.0_linux_amd64.tar.gz'
      sha256 '9c08ebe62f9a4893790140074dc8deac0391d1c935da6895657e0e3457523c3c'
    end
  end

  head do
    url 'https://github.com/fujiwara/kinesis-tailf.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kinesis-tailf'
    bin.install 'kinesis-cat'
  end
end
