class Grpcp < Formula
  desc 'gRPC stream file transfer server/client'
  version '0.1.0'
  homepage 'https://github.com/fujiwara/grpcp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.1.0/grpcp_0.1.0_darwin_arm64.tar.gz'
      sha256 '9de4f0651d72e28988297590b2bd872cde230075e76f27b35a40ed1ff04b0451'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.1.0/grpcp_0.1.0_darwin_amd64.tar.gz'
      sha256 '1d5bd17bc26dc8f9b7d5849f47b0ff71b91b2187c0051c014994420a6bc1ca11'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.1.0/grpcp_0.1.0_linux_arm64.tar.gz'
      sha256 'e0217f5924f48104cbba40386232d5d2a34884924c7fc7b846ab86974fbdd915'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.1.0/grpcp_0.1.0_linux_amd64.tar.gz'
      sha256 '708f49d9e5294c407b0a56ad522824ae9452813f4aaf9aeb3311dfcc7785a7da'
    end
  end

  head do
    url 'https://github.com/fujiwara/grpcp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'grpcp'
  end
end
