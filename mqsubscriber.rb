class Mqsubscriber < Formula
  desc 'A subscriber for Sakura SimpleMQ and RabbitMQ.'
  version '0.7.7'
  homepage 'https://github.com/fujiwara/mqsubscriber'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.7/mqsubscriber_v0.7.7_darwin_arm64.tar.gz'
      sha256 '9b6c1a7364f8777b977b0aa7ee4fa3abc7c1f44e66899f55c607e9eb29ef1fdc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.7/mqsubscriber_v0.7.7_darwin_amd64.tar.gz'
      sha256 'e058ffc37704cca28f6e57530ccad0f7daaa2ebf327f73f9c7a4ee287d33d6de'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.7/mqsubscriber_v0.7.7_linux_arm64.tar.gz'
      sha256 '5b62563c09b02a7c9b0f2331e58a4ef0684d43dad9c37754929f164c3706b0bd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/mqsubscriber/releases/download/v0.7.7/mqsubscriber_v0.7.7_linux_amd64.tar.gz'
      sha256 '8384f39595053b211dd435e1bdafa55f13661bc290bccd5772f0b1c5d47cd643'
    end
  end

  head do
    url 'https://github.com/fujiwara/mqsubscriber.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mqsubscriber'
  end

  test do
    system "#{bin}/mqsubscriber", '-h'
  end
end
