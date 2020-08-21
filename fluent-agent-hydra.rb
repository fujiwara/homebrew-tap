class FluentAgentHydra < Formula
  version '0.3.1'
  homepage 'https://github.com/fujiwara/fluent-agent-hydra'
  if OS.mac?
    url "https://github.com/fujiwara/fluent-agent-hydra/releases/download/v0.3.1/fluent-agent-hydra-v0.3.1-darwin-amd64.zip"
    sha256 '6d5bb2fb8e246ff6ea87b52e5777368713a1b83951fd2d78efeb8c130634b91b'
  end
  if OS.linux?
    url "https://github.com/fujiwara/fluent-agent-hydra/releases/download/v0.3.1/fluent-agent-hydra-v0.3.1-linux-amd64.zip"
    sha256 'b4e8441861009d6df7390f6b32986218527a92028cf889ce324818c46020d40e'
  end
  head 'https://github.com/fujiwara/fluent-agent-hydra.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv fluent-agent-hydra-v*-darwin-amd64 fluent-agent-hydra'
    bin.install 'fluent-agent-hydra'
  end
end
