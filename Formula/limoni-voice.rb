class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.11.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.2/limoni-voice_v1.11.2_darwin_arm64.tar.gz"
      sha256 "34a9cb69a87afd28f532abbbe8628bca0b32769794a2fb48aa7d0e68d7c123d6"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.2/limoni-voice_v1.11.2_darwin_amd64.tar.gz"
      sha256 "791548a5718033be9c90e6e8c7f65ad976ccac1b17728a4a2be403bd80413db2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.2/limoni-voice_v1.11.2_linux_arm64.tar.gz"
      sha256 "981bc3d9afba2b485d30b77d6023b4288ba07852b1ab8a4341198e2d8c46bf5e"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.2/limoni-voice_v1.11.2_linux_amd64.tar.gz"
      sha256 "3d25d1e7c2a52a2200871cd2580f25126ad538f485c0d625bda4ac8377287737"
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
