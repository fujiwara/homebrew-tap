class Greenlight < Formula
  desc 'greenlight is a graceful health check agent.'
  version '0.0.4'
  homepage 'https://github.com/fujiwara/greenlight'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.4/greenlight_0.0.4_darwin_arm64.tar.gz'
      sha256 'c527c592b77425eb194a548d032a4cb8a130b71e912505aad491e87ea06105a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.4/greenlight_0.0.4_darwin_amd64.tar.gz'
      sha256 '700423690b9fa5b5670d5b71662db157aef2588f761b679534bbe434d15b2153'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.4/greenlight_0.0.4_linux_arm64.tar.gz'
      sha256 'b5ed882c185e9ea4b3aadee256e2be4c86874d3a4a2dea72dede54dadf883a0c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.4/greenlight_0.0.4_linux_amd64.tar.gz'
      sha256 'f1baa2bafe1defb3f0174e6a59b446cae88852f8339e7bf9c5fc6e112c2b0ccb'
    end
  end

  head do
    url 'https://github.com/fujiwara/greenlight.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'greenlight'
  end
end
