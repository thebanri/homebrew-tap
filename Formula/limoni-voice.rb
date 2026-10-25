class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.7"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.7/limoni-voice_v1.17.7_darwin_arm64.tar.gz"
      sha256 "606f37d118d262fd743fe679ddaae953562c0388340a42d867d9e28c23e5e112"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.7/limoni-voice_v1.17.7_darwin_amd64.tar.gz"
      sha256 "e77ad6aa4330605c6ff5eccab86d9b4eb30883b193205825b28d21f99ec7d2d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.7/limoni-voice_v1.17.7_linux_arm64.tar.gz"
      sha256 "4d6f4ee465216c9fedbfb8489b1ae469f898dea186f33bb554a67dadc18fe44a"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.7/limoni-voice_v1.17.7_linux_amd64.tar.gz"
      sha256 "51043068ebdeac33b91d30563bc3088d072d04995f7acabebfb64c1b9d58ee12"
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
