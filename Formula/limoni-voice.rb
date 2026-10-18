class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.14.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.14.0/limoni-voice_v1.14.0_darwin_arm64.tar.gz"
      sha256 "a255f9308b21073230961c7bd3f47474da9572536bf1507c312bd446e5498b65"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.14.0/limoni-voice_v1.14.0_darwin_amd64.tar.gz"
      sha256 "da3a6e637d865604ba44652ad9f95506bdb17c2c5d68cc96a355a4ff89f35bc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.14.0/limoni-voice_v1.14.0_linux_arm64.tar.gz"
      sha256 "289be60e091e0787dd8efdb98ff2706336fe5e2bc5201b3c2e72ddbd031643de"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.14.0/limoni-voice_v1.14.0_linux_amd64.tar.gz"
      sha256 "3320f66586423e2405e4c24ba1ac119b45750cb93911cbd506803dc7fd6463ac"
    end
  end

  def install
    bin.install "limoni-voice"
  end

  def caveats
    <<~TEXT
      Screen sharing needs ffmpeg and mpv:
        brew install ffmpeg mpv
      On macOS the cask installs Limoni Voice.app instead, which also opens limoni://
      invite links; it includes this command, so use one or the other:
        brew uninstall limoni-voice && brew install --cask thebanri/tap/limoni-voice-app
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/limoni-voice --version")
  end
end
