class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.4.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.0/tfstate-lookup_1.4.0_darwin_arm64.tar.gz'
      sha256 '47885c1de991e575a42126970f5ff5416d0e33e33d6a24089aa25439ae872419'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.0/tfstate-lookup_1.4.0_darwin_amd64.tar.gz'
      sha256 '5a20cce63c46ef9697470e52f8a7787b1ede901952f1055475c38edcfdef25a4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.0/tfstate-lookup_1.4.0_linux_arm64.tar.gz'
      sha256 '330e248345264156c6271ce6b40a9d8265dbbabfc6af41f014f46bfd1aab2c8a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.4.0/tfstate-lookup_1.4.0_linux_amd64.tar.gz'
      sha256 '0950a51cf90252b792f63700000816d6afb24be4349cdd4e6160a00ee6c678f7'
    end
  end

  head do
    url 'https://github.com/fujiwara/tfstate-lookup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tfstate-lookup'
  end
end
