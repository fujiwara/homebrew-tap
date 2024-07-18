class IamPolicyFinder < Formula
  desc 'iam-policy-finder is finder of AWS IAM Policies.'
  version '0.0.3'
  homepage 'https://github.com/fujiwara/iam-policy-finder'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.3/iam-policy-finder_0.0.3_darwin_arm64.tar.gz'
      sha256 'adc16291d3d52b44c68eea42a1dbfdff1986e05c630ab40fb8a65d709060694d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.3/iam-policy-finder_0.0.3_darwin_amd64.tar.gz'
      sha256 'e985a0564a853f12745ca80bfe26380d262d1c7adf944c4920f96713d5286277'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.3/iam-policy-finder_0.0.3_linux_arm64.tar.gz'
      sha256 'd002240ad2f60b2a05960ed2dc7e8c82f357480ab25e17640c2155854f9a9ea7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.3/iam-policy-finder_0.0.3_linux_amd64.tar.gz'
      sha256 '3ad6d2dbf60ab85a05a877ed6036088405859758b7c4c5106f875dda110851bf'
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
