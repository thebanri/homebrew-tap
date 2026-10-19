class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.16.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.0/limoni-voice_v1.16.0_darwin_arm64.tar.gz"
      sha256 "5c25c94657eb939415d5345d9d0b69bc39882c1f6db1e78f7855b92d8f9d9618"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.0/limoni-voice_v1.16.0_darwin_amd64.tar.gz"
      sha256 "567a2bf1b1a9a7e2ee63a4307fc751a937263cf8e083d2bd0d015a6e163fe10d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.0/limoni-voice_v1.16.0_linux_arm64.tar.gz"
      sha256 "808953fbc98ee406798be1398fe962c03e7fce8ca835bf1debda6ec3ce21cd03"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.0/limoni-voice_v1.16.0_linux_amd64.tar.gz"
      sha256 "e871d47879b5fc64f39ca6f0ee220c93278f98670afd470133cb4e76287e9966"
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
