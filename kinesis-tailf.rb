class KinesisTailf < Formula
  desc 'tail -f command for Amazon Kinesis Stream'
  version '0.3.2'
  homepage 'https://github.com/fujiwara/kinesis-tailf'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.2/kinesis-tailf_0.3.2_darwin_arm64.tar.gz'
      sha256 '3daf896cd545b1cbef16feb50692cf433b6b33221137aa4435d7f450498ad84e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.2/kinesis-tailf_0.3.2_darwin_amd64.tar.gz'
      sha256 'c109cb7cd5c873238e936aeb77bb142e62351aa6e0ad4393db95ad96997ab08e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.2/kinesis-tailf_0.3.2_linux_arm64.tar.gz'
      sha256 '9089a47b2bbf6deb427772440d535e12d73b76adb1b768be2553580782ae8081'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kinesis-tailf/releases/download/v0.3.2/kinesis-tailf_0.3.2_linux_amd64.tar.gz'
      sha256 '09bfe49f412c4835fd40d2490b7ace3111e8fffa068f4f718893d44c1495ab4d'
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
