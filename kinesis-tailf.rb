class KinesisTailf < Formula
  desc 'tail -f command for Amazon Kinesis Stream'
  version '0.4.0'
  homepage 'https://github.com/fujiwara/kinesis-tailf'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.4.0/kinesis-tailf_0.4.0_darwin_arm64.tar.gz'
      sha256 'b5156bcb969fec08d0bf099deea51109031dba7ab945b677b338d7cbc35c8ba0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.4.0/kinesis-tailf_0.4.0_darwin_amd64.tar.gz'
      sha256 'bb87a3106c91ae70c8327aee985a9fbb2c2ded5ad735fbe05c617dfbfa9b74e3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.4.0/kinesis-tailf_0.4.0_linux_arm64.tar.gz'
      sha256 '36b9f6304496f654326da1baa8dbac90f934bb90f2a722e8927b3e49f0749303'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.4.0/kinesis-tailf_0.4.0_linux_amd64.tar.gz'
      sha256 'af7917ba7b8301591a7c26fa2c8e340899c8e7a358bb2427dd17fda1e03cfade'
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
