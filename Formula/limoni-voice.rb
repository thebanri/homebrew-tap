class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.5.1/limoni-voice_v1.5.1_darwin_arm64.tar.gz"
      sha256 "f9ff8663d3ba3b6a5c07f7619ff2b97ba469b0f5ee5f1ef2bae2c47c48851e0c"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.5.1/limoni-voice_v1.5.1_darwin_amd64.tar.gz"
      sha256 "521bf7e75e61a7ee0f922bc33288ef8c7ee97006cc7f4b3dc81469434ab9c73c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.5.1/limoni-voice_v1.5.1_linux_arm64.tar.gz"
      sha256 "02f9e25cbec41ea69ac222c1ebd54bc2a6674ebfdd8042e89cb114ec15155b7f"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.5.1/limoni-voice_v1.5.1_linux_amd64.tar.gz"
      sha256 "d53ddfa1a1caeb1a9129920134f55140b468e9cfb892f0295a8426ef2df9020b"
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
