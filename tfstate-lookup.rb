class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.6.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.6.0/tfstate-lookup_1.6.0_darwin_arm64.tar.gz'
      sha256 'b5be01f7e18bf1b81a291f1b1735340ef0cf2c09681844d96dabff8f8646d20c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.6.0/tfstate-lookup_1.6.0_darwin_amd64.tar.gz'
      sha256 '73bf64156af87382b8c409202ed1b953ce064d6220c304e05fcaeb71a6313017'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.6.0/tfstate-lookup_1.6.0_linux_arm64.tar.gz'
      sha256 'f1142ab941d42c590bdcd544126a94667a2c39f2c6275973affea7a474fa7338'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.6.0/tfstate-lookup_1.6.0_linux_amd64.tar.gz'
      sha256 '0d92f8d3dfdcf473d3d26d2f95078bc69f20b3b46bdf86d98200fe1205299bb4'
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
