class IamPolicyFinder < Formula
  desc 'iam-policy-finder is finder of AWS IAM Policies.'
  version '0.0.1'
  homepage 'https://github.com/fujiwara/iam-policy-finder'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.1/iam-policy-finder_0.0.1_darwin_arm64.tar.gz'
      sha256 '89fd2ef718be66a9eb430377740d0d4ea94f2535c880e2df91e6ed2726fcfe48'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.1/iam-policy-finder_0.0.1_darwin_amd64.tar.gz'
      sha256 'daab7276203fafb355fb55d6ed91e42ece704ddf77d1f2d82d3c5c140cd4a142'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.1/iam-policy-finder_0.0.1_linux_arm64.tar.gz'
      sha256 '4f4bb904b984f06cfd8ec4384e7380ddcb1dc071a568659bd497fd4a77c0a53d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/iam-policy-finder/releases/download/v0.0.1/iam-policy-finder_0.0.1_linux_amd64.tar.gz'
      sha256 '122d6e8a44058f1755f46c1cbdca8f10bce09387f513f100be54794118d3be8d'
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
