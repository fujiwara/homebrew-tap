class Rin < Formula
  desc 'Rin is a Redshift data Importer by SQS messaging.'
  version '1.2.0'
  homepage 'https://github.com/fujiwara/rin'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/Rin/releases/download/v1.2.0/Rin_1.2.0_darwin_arm64.tar.gz'
      sha256 'ffeecb2a29b020e6f90da1937b518998883746fcadbd4d749af93d263542b880'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/Rin/releases/download/v1.2.0/Rin_1.2.0_darwin_amd64.tar.gz'
      sha256 'fb6186659721edd609f1e1fb396f2c760f643cba15db106a913a9b0ab3bf51d5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/Rin/releases/download/v1.2.0/Rin_1.2.0_linux_arm64.tar.gz'
      sha256 '9d0f688d7be9a2b3a18d9447efc3127192aa8f6ef5aba6dfd0580869dfe9ae6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/Rin/releases/download/v1.2.0/Rin_1.2.0_linux_amd64.tar.gz'
      sha256 '071abfdc6c4298e2012471dc6b5755f9df986e09fc328f605c9305efc1507757'
    end
  end

  head do
    url 'https://github.com/fujiwara/rin.git'
    depends_on 'go' => :build
  end

  def install
    bin.install 'rin'
  end
end
