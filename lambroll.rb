class Lambroll < Formula
  desc 'lambroll is a minimal deployment tool for AWS Lambda.'
  version '1.5.1'
  homepage 'https://github.com/fujiwara/lambroll'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.1/lambroll_v1.5.1_darwin_arm64.tar.gz'
      sha256 '45646790e15313615391ce0ed7e1f9684623f1b2990404f72d24b16548255ca0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.1/lambroll_v1.5.1_darwin_amd64.tar.gz'
      sha256 'f208dde4f4a7f36a3204cefabb0522652e0c942f25bf704e454089806a5ed709'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.1/lambroll_v1.5.1_linux_arm64.tar.gz'
      sha256 'c4d7701ff67bbff48792d0688df3ee994b41e9649cc165afea3ca7807cd92b65'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/lambroll/releases/download/v1.5.1/lambroll_v1.5.1_linux_amd64.tar.gz'
      sha256 'b4e5ac26934bac9eb52500998becb07cc8b62f363f18b66222df26cdcb8e3183'
    end
  end

  head do
    url 'https://github.com/fujiwara/lambroll.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
      system 'mv', 'cmd/lambroll/lambroll', '.'
    end
    bin.install 'lambroll'
  end
end
