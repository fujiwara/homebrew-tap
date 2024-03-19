class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.2.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.2.0/tfstate-lookup_1.2.0_darwin_arm64.tar.gz'
      sha256 '22e5f3db47f78a9d4068bd02c5139bee54fb634e6b0ec3dc746fc3929fc22edc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.2.0/tfstate-lookup_1.2.0_darwin_amd64.tar.gz'
      sha256 '7450bbb8581316a59a411b6eb49d4c272d66b4362022c94ccaa5671b119823f0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.2.0/tfstate-lookup_1.2.0_linux_arm64.tar.gz'
      sha256 'fbfd7db814cd46b6cb696bc21769ad8a20fa43ec9977ecf208d30818d611a65c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.2.0/tfstate-lookup_1.2.0_linux_amd64.tar.gz'
      sha256 'a9ff5392e965cbba79c672d475312f857183e1eae20b5634318cfe39bac2f4e9'
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
