class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.7.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_darwin_arm64.tar.gz"
      sha256 "7a27befbfae524ca32cb0703f1abf18b6b7c0ada2bedb0c4f1a704ebd4bf9d02"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_darwin_amd64.tar.gz"
      sha256 "3e97e16df3fb46630f894105b58b9b414337d186e61e5cbe26599863ca7296e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_linux_arm64.tar.gz"
      sha256 "cb81eb85b0e2aba8cd8741e4dfa0bdaa118a97a19b508f6835a7c2f686f86360"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_linux_amd64.tar.gz"
      sha256 "197177d2612ee2a3b0880cc0be024a9b2e1687fd371e3d4cad458a887ded30a4"
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
