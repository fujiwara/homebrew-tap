class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.10.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.10.0/tfstate-lookup_1.10.0_darwin_arm64.tar.gz'
      sha256 '43b9af777bbe4a67f483a210ca254884615903f9884c8998bbca74e43b9cd4f1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.10.0/tfstate-lookup_1.10.0_darwin_amd64.tar.gz'
      sha256 'facb7fdc03313fc359f053de9e8ea97a3df73903eeab13db11a3b8b73620bb50'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.10.0/tfstate-lookup_1.10.0_linux_arm64.tar.gz'
      sha256 'e069da544c22bcbc7a4eea10959e6e97b1e9e99f70b8c4fd9bc0c96634164d4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.10.0/tfstate-lookup_1.10.0_linux_amd64.tar.gz'
      sha256 'deeacca185dd48c5bb5339bdcfaaa6828e9d1d97a5a011bf26451eef92ffd5d4'
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
