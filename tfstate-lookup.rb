class TfstateLookup < Formula
  desc 'Lookup resource attributes in tfstate.'
  version '1.5.0'
  homepage 'https://github.com/fujiwara/tfstate-lookup'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.5.0/tfstate-lookup_1.5.0_darwin_arm64.tar.gz'
      sha256 '8aa7b1be51ce96d759d55d5f438067e6111c155f443dca65e246c12c2147e386'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.5.0/tfstate-lookup_1.5.0_darwin_amd64.tar.gz'
      sha256 '76a37344bf40baf8183b2ea87722ef1bbe3c3050bab35b10d9908b79ddd1bb63'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.5.0/tfstate-lookup_1.5.0_linux_arm64.tar.gz'
      sha256 '01c5acb973a9414b2470ee640f36b0426f8d5e202c0992ecd67e4c8cadb54ad4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/tfstate-lookup/releases/download/v1.5.0/tfstate-lookup_1.5.0_linux_amd64.tar.gz'
      sha256 '4fc1dcbbc465ac51e2fb41d0aad792a37dee717e4ba8cf7c24ac716c72af923a'
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
