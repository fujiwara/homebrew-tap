class Awslim < Formula
  desc 'A simplified alternative to the AWS CLI for limited use cases.'
  version '0.5.0'
  homepage 'https://github.com/fujiwara/awslim'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.5.0/awslim_0.5.0_darwin_arm64.tar.gz'
      sha256 '8a33694329296034da28df17dd04c8e7312588e94dfec587a54103674da367fa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.5.0/awslim_0.5.0_darwin_amd64.tar.gz'
      sha256 'a7f822c96972fd51be3f3adfac45121a7a2f4f9e243d7884271356e87c12213f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.5.0/awslim_0.5.0_linux_arm64.tar.gz'
      sha256 'da9c49a86451481b55ed7b384efd289bf862b8389b0a1818b790d26d973cba9c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/awslim/releases/download/v0.5.0/awslim_0.5.0_linux_amd64.tar.gz'
      sha256 'feb9ca67fc5e03200aa825af16479b53fec8e5f589072990fc6453bf7dabc34b'
    end
  end

  head do
    url 'https://github.com/fujiwara/awslim.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'awslim'
  end
end
