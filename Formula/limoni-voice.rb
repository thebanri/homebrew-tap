class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.13.5"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.5/limoni-voice_v1.13.5_darwin_arm64.tar.gz"
      sha256 "01306eb5d221c45ac0fad0441e0b5b84e7888296675e93347aa30e539186b88b"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.5/limoni-voice_v1.13.5_darwin_amd64.tar.gz"
      sha256 "69a482c8574dfc0c922ee3f3b52340a15e9b748f5a8dfb41cb5ef17270faafbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.5/limoni-voice_v1.13.5_linux_arm64.tar.gz"
      sha256 "518c69b72dc6e1576255913c82213ad6726d894eee603d5142d3b177c4e190b9"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.5/limoni-voice_v1.13.5_linux_amd64.tar.gz"
      sha256 "d1a17066bbff86cd1ebf960dfff3b5c9aa118b65dd59c8fe88201c8b44cffc44"
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
