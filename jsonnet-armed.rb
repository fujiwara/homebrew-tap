class JsonnetArmed < Formula
  desc 'A Jsonnet rendering tool with additional useful functions.'
  version '0.0.9'
  homepage 'https://github.com/fujiwara/jsonnet-armed'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.9/jsonnet-armed_0.0.9_darwin_arm64.tar.gz'
      sha256 '8f3110ff9c694ad419b6c541b071d54a510493afd7715a0fdd576198dd7142b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.9/jsonnet-armed_0.0.9_darwin_amd64.tar.gz'
      sha256 'ea4e0e80126bb416ad76f08bf74a074e30cc5d032fba575f2ee693b956bfe653'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.9/jsonnet-armed_0.0.9_linux_arm64.tar.gz'
      sha256 '35789695f254e783ec151477c20835fe09e3cb9bd2050e883ea07eb0f0835521'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/jsonnet-armed/releases/download/v0.0.9/jsonnet-armed_0.0.9_linux_amd64.tar.gz'
      sha256 '84ad44d007d51310ebe62862b37174a6c3d22b4420994e6297fdecb95789e8d8'
    end
  end

  head do
    url 'https://github.com/fujiwara/jsonnet-armed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'jsonnet-armed'
  end
end
