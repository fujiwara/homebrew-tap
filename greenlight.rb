class Greenlight < Formula
  desc 'greenlight is a graceful health check agent.'
  version '0.0.5'
  homepage 'https://github.com/fujiwara/greenlight'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.5/greenlight_0.0.5_darwin_arm64.tar.gz'
      sha256 'af8926eec03995722edd12f150cba19fa3457cc3a8d95a8daae28438bfcc11d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.5/greenlight_0.0.5_darwin_amd64.tar.gz'
      sha256 '07e8e0f89e463c793f46539ec479a4fe41ec79244852b45e2b9530c3ecfda985'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.5/greenlight_0.0.5_linux_arm64.tar.gz'
      sha256 '01f91e25174df4ad72170dcce9724a06704bb4ece82f2c1fdf4111e0988d9d68'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/greenlight/releases/download/v0.0.5/greenlight_0.0.5_linux_amd64.tar.gz'
      sha256 '835e23a5b717eac03442aecfa31dc0f70718a69f7c4e668fd3c18b0081d0e615'
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
