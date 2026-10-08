class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.7"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.7/limoni-voice_v1.12.7_darwin_arm64.tar.gz"
      sha256 "d3d41634a85da33f3619cd6226427d2ffb3e25b73cabab9c0d1b76b692b78b50"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.7/limoni-voice_v1.12.7_darwin_amd64.tar.gz"
      sha256 "063cc6f5e590e219064b1567d2568ac2f566e99293866178b7a68dec598a4c04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.7/limoni-voice_v1.12.7_linux_arm64.tar.gz"
      sha256 "f8b0402b877009aefb0590b08a122dc79bd0d69a1d1f6031bb0c369f415bd351"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.7/limoni-voice_v1.12.7_linux_amd64.tar.gz"
      sha256 "64c771aa1ebdd492fab1314ddf1bf22f7f9675020d48136207213ade5a2a66d7"
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
