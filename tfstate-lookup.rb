class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.11.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.11.0/tfstate-lookup_1.11.0_darwin_arm64.tar.gz'
      sha256 '7ff7b843111eb1bbf4f2c4c5feee7d05e124b911d9eae280cbc3f7f7ccc6e92b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.11.0/tfstate-lookup_1.11.0_darwin_amd64.tar.gz'
      sha256 'ac7753b5f2af42fb24496ec5a808980dbfd6abe4324fea5f119c812ca39e4a41'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.11.0/tfstate-lookup_1.11.0_linux_arm64.tar.gz'
      sha256 '7b02dac748453e138928111a79a6220512f594e1923697ad35e8b8d066d4c4a5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.11.0/tfstate-lookup_1.11.0_linux_amd64.tar.gz'
      sha256 'c1d0e86b80246f97c9e355b51a5c87e5e380735256a2ef768f0ab3891555e467'
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
