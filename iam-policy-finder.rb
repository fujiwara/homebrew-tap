class IamPolicyFinder < Formula
  desc 'iam-policy-finder is finder of AWS IAM Policies.'
  version '0.0.2'
  homepage 'https://github.com/fujiwara/iam-policy-finder'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.2/iam-policy-finder_0.0.2_darwin_arm64.tar.gz'
      sha256 '0787730af60aa8c85e28328ef8b4cda110ecf5cdc93e14a5319bf25c26eaa750'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.2/iam-policy-finder_0.0.2_darwin_amd64.tar.gz'
      sha256 'da7dfc653115b0b5045497a674a9788a234caed2dcdb710a2d342193de65d179'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.2/iam-policy-finder_0.0.2_linux_arm64.tar.gz'
      sha256 '40d91a7415c2dde0d401e7b968ecaf59b2f19ed3a791b55a5484b9a90a602dfc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.2/iam-policy-finder_0.0.2_linux_amd64.tar.gz'
      sha256 'ef10ad986539cf1716587d67920d07a3f52d13436591aa032ec82e9eac0acbd6'
    end
  end

  head do
    url 'https://github.com/fujiwara/iam-policy-finder.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'iam-policy-finder'
  end
end
