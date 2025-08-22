class Kt < Formula
  desc 'Kafka command line tool that likes JSON'
  version '14.2.0'
  homepage 'https://github.com/fujiwara/kt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/kt/releases/download/v14.2.0/kt_14.2.0_darwin_arm64.tar.gz'
      sha256 '8c7b012280dcdad9178246aca1de8dd3b0174c23b84033a1a8911010542df041'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v14.2.0/kt_14.2.0_darwin_amd64.tar.gz'
      sha256 'a87ae40c8ce6156c99ee54960e2fb1cde418b7197ab79857cf833c0d0a556010'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/kt/releases/download/v14.2.0/kt_14.2.0_linux_arm64.tar.gz'
      sha256 'a7cb6f1fc20e0cd16ff8fc8ceabc7be62597e819f5a72e1358b202226b3290af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/kt/releases/download/v14.2.0/kt_14.2.0_linux_amd64.tar.gz'
      sha256 '5a26378e7834a7cd167ba57df2aa62ba7483441a9dd057b8c1b25c47fdce235a'
    end
  end

  head do
    url 'https://github.com/fujiwara/kt.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'kt'
  end
end
