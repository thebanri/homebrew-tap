class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.8.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.8.0/limoni-voice_v1.8.0_darwin_arm64.tar.gz"
      sha256 "0a2c6417a1057a061ee818aa83e81e635b2e138fbf5339e707a190e7d13d3792"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.8.0/limoni-voice_v1.8.0_darwin_amd64.tar.gz"
      sha256 "57ee290095a6c64496aac4b9647fa276b89d8ab5742ecb6c4c2f39708ee715f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.8.0/limoni-voice_v1.8.0_linux_arm64.tar.gz"
      sha256 "539bff3a46fcb2c0405b36b26b5196033722dddab17819c10c22430bdaafde3f"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.8.0/limoni-voice_v1.8.0_linux_amd64.tar.gz"
      sha256 "077724a2ba5cff97a43fde2388d55b0b751d00c2628a8fb0e3bb3f88b29ff699"
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
