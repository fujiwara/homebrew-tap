class Grpcp < Formula
  desc 'gRPC stream file transfer server/client'
  version '0.0.5'
  homepage 'https://github.com/fujiwara/grpcp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.5/grpcp_0.0.5_darwin_arm64.tar.gz'
      sha256 'ea6cc536cca515dd2b3b569938db8d52349336c9aaf11942be06c8ee27186760'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.5/grpcp_0.0.5_darwin_amd64.tar.gz'
      sha256 '3368c7deb688a9e8d2556e5ef17d5be3faa25a748b8592c11e8836376e9cce4c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.5/grpcp_0.0.5_linux_arm64.tar.gz'
      sha256 'ce57f8d62fcfd2e59953d27d1a836f8804399103570abcb9d82cadaf3870f4ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/grpcp/releases/download/v0.0.5/grpcp_0.0.5_linux_amd64.tar.gz'
      sha256 'fe28ae2d74013982c848a2a4da6045007c9a2e2be743ca5d2015143fe0273972'
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
