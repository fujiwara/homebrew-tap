class Ecrm < Formula
  desc 'A command line tool for managing ECR repositories.'
  version '0.4.0'
  homepage 'https://github.com/fujiwara/ecrm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.4.0/ecrm_0.4.0_darwin_arm64.tar.gz'
      sha256 '561b7b18565ecf6370358c54cce1caf8f2336b786caef067814a5c476a7fc78a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.4.0/ecrm_0.4.0_darwin_amd64.tar.gz'
      sha256 '5c19bb92aca0b0c7a26b2e649fe087fb4ba70be4f629f45e0e54fc8802cabff4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.4.0/ecrm_0.4.0_linux_arm64.tar.gz'
      sha256 '35095bc34d2ada9309953e9f1efbd5850d00682fc3fc8c0e6b78fe3a65485602'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/fujiwara/ecrm/releases/download/v0.4.0/ecrm_0.4.0_linux_amd64.tar.gz'
      sha256 '85b50dd2b7e33cada587153ef69ec676153283800fe49846bfab634e10bb2a0e'
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
