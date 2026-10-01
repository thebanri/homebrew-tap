class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.11.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.0/limoni-voice_v1.11.0_darwin_arm64.tar.gz"
      sha256 "cd0f399de700a3c8e8405852ec46cde81fe5a6c91353e8fc556a902dc756e264"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.0/limoni-voice_v1.11.0_darwin_amd64.tar.gz"
      sha256 "bcb66bfff47251ddb65a5bd73c0c9b891d994a79243c93c56eae181cd18a5f5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.0/limoni-voice_v1.11.0_linux_arm64.tar.gz"
      sha256 "5ca0f188202e510fa445a28f8cdcb7ecf34d8624c497b167fb537b4e93d366cc"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.11.0/limoni-voice_v1.11.0_linux_amd64.tar.gz"
      sha256 "cbf4304c76ea5a2cbd083dcb323e700179069f84d847c98b6f111b4dd810b52b"
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
