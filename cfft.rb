class Cfft < Formula
  desc 'cfft is a testing tool for CloudFront Functions.'
  version '0.8.0'
  homepage 'https://github.com/fujiwara/cfft'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.0/cfft_0.8.0_darwin_arm64.tar.gz'
      sha256 'a4df234c9268b4110180048b05d48ecca81837134c915b4393e99ee963a0ae36'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.0/cfft_0.8.0_darwin_amd64.tar.gz'
      sha256 '4534425f061ea77a809fa149abadd97210162144e1828e8c26c4cd66e2be0dd1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.0/cfft_0.8.0_linux_arm64.tar.gz'
      sha256 '616c22060f238230e24937bd169cefe74d71a7d8238cb2bade8df9e2695cb887'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/cfft/releases/download/v0.8.0/cfft_0.8.0_linux_amd64.tar.gz'
      sha256 '61ac26599a87191f1bef36c933ddcc4c4056627c88e7b9a22570dc7d41556ade'
    end
  end

  head do
    url 'https://github.com/fujiwara/cfft.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cfft'
  end
end
