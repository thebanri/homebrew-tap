class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.8"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.8/limoni-voice_v1.17.8_darwin_arm64.tar.gz"
      sha256 "d13a9e01fa59c53efbd7d883539de0cce6557b6dd69e97d386018908d06bc98d"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.8/limoni-voice_v1.17.8_darwin_amd64.tar.gz"
      sha256 "3dd1c2bf6101c8f40247ce78cb3190704f0446afcad0e84c87197fda96d727e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.8/limoni-voice_v1.17.8_linux_arm64.tar.gz"
      sha256 "bbfbe9bfdfd2252c1153607086db4446e35fe59d8adb642bfe79a093ddfa3664"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.8/limoni-voice_v1.17.8_linux_amd64.tar.gz"
      sha256 "1575f46a7cb13b89b56c400bc186c803b19b7e74e3ee4d0a97fb1a6d42b68320"
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
