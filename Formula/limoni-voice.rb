class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.2/limoni-voice_v1.12.2_darwin_arm64.tar.gz"
      sha256 "336728b9c0ca49964558965a616dcceb45b2877efb56ac5f69fa88a2905fbe83"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.2/limoni-voice_v1.12.2_darwin_amd64.tar.gz"
      sha256 "274a88272b5a019d7377d640b01320a756ccabf0360d877074bf072b7cb50678"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.2/limoni-voice_v1.12.2_linux_arm64.tar.gz"
      sha256 "73a08fcdd3cfe708d1e52a32c34f480f545ed44ee34c2ba37472cad959955287"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.2/limoni-voice_v1.12.2_linux_amd64.tar.gz"
      sha256 "ff398446cf5a465eae1e44acd5150a4a605c8792064cbc672404da1a24ca7b9f"
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
