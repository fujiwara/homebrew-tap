class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.5.0'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.5.0/ecrm_0.5.0_darwin_arm64.tar.gz'
      sha256 '9efdec14080ae0e3cd6a390a0b6b6e81d8d7f06498a01275f4c72209f72c7fa5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.5.0/ecrm_0.5.0_darwin_amd64.tar.gz'
      sha256 '47559cce4304f945f05e7d39b2041c1f0ba5453373b900033466175b9e4ed560'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.5.0/ecrm_0.5.0_linux_arm64.tar.gz'
      sha256 'da39086d657dc7cbd420f2638011ab6a15f06042df5c980f62a2f202c21db01c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.5.0/ecrm_0.5.0_linux_amd64.tar.gz'
      sha256 '794d60ab60a7aaeaa24edb2ae95ee4f2135bcb883d1e5c41b46357838580c546'
    end
  end

  head do
    url 'https://github.com/fujiwara/ecrm.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecrm'
  end
end
