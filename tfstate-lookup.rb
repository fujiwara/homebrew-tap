class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.0.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.0.0/tfstate-lookup_1.0.0_darwin_arm64.tar.gz'
      sha256 '5d4ee14ee3f8823f826f5edc75c75de0e39db7f4bc061f64a2e1307c11353572'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.0.0/tfstate-lookup_1.0.0_darwin_amd64.tar.gz'
      sha256 'a0ad8bc89c687f2789e06c557d676d59d4eaee184e01ae2e3551f9d04c378641'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.0.0/tfstate-lookup_1.0.0_linux_arm64.tar.gz'
      sha256 'deab0d8301991aad0444b556a935a95b2b1084ed6d8457e00077d7826f5e7940'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.0.0/tfstate-lookup_1.0.0_linux_amd64.tar.gz'
      sha256 '11e4c371f77345e018641ccdfb9308d6d1e9ea81b8a9a715820ff7920f9189a0'
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
