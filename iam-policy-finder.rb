class IamPolicyFinder < Formula
  desc 'iam-policy-finder is finder of AWS IAM Policies.'
  version '0.0.4'
  homepage 'https://github.com/fujiwara/iam-policy-finder'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.4/iam-policy-finder_0.0.4_darwin_arm64.tar.gz'
      sha256 '1d12c16704c77cac6811d5dad6ae8d8d475833931eb671e75db1b5d1e544e441'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.4/iam-policy-finder_0.0.4_darwin_amd64.tar.gz'
      sha256 '85da7aec24999dcea16e40cb7421301082a8e05505ea1f09172e1cb87775b018'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.4/iam-policy-finder_0.0.4_linux_arm64.tar.gz'
      sha256 '569a6d729fb2159e532208901a7e9504a000fa66d41a0fc387688da1a421eadf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.4/iam-policy-finder_0.0.4_linux_amd64.tar.gz'
      sha256 '2c46d5ec783dddab49bf81b453121cab2d6f46756933fa9ad845208311754781'
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
