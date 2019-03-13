class FluentAgentHydra < Formula
  version '0.1.6'
  homepage 'https://github.com/fujiwara/fluent-agent-hydra'
  url "https://github.com/fujiwara/fluent-agent-hydra/releases/download/v0.1.6/fluent-agent-hydra-v0.1.6-darwin-amd64.zip"
  sha256 'baa801eaf5288809ca2c321790284293edd087ac6c36164c2d1757a380d73825'
  head 'https://github.com/fujiwara/fluent-agent-hydra.git'

  def install
    system 'mv', 'fluent-agent-hydra-v0.1.6-darwin-amd64', 'fluent-agent-hydra'
    bin.install 'fluent-agent-hydra'
  end
end
