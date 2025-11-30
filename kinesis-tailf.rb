class KinesisTailf < Formula
  desc 'tail -f command for Amazon Kinesis Stream'
  version '0.5.1'
  homepage 'https://github.com/fujiwara/kinesis-tailf'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.1/kinesis-tailf_0.5.1_darwin_arm64.tar.gz'
      sha256 '3238ee2e70e1e39df5671804e5d298a7b15b4c3ab563cd759b387102858fceac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.1/kinesis-tailf_0.5.1_darwin_amd64.tar.gz'
      sha256 '9882f58632522d15fa2ead2970d67ba499b10f984936fa0df782e3cbfdfb9272'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.1/kinesis-tailf_0.5.1_linux_arm64.tar.gz'
      sha256 '3aac1578a821e4bfe07368ea9b6dd774675c98ac26e703d767aae8c7ea33076b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.5.1/kinesis-tailf_0.5.1_linux_amd64.tar.gz'
      sha256 '1b1caea363b4272a0d652a49c3b89f6f93effa6986fd8ef9cf2592ac180e345e'
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
