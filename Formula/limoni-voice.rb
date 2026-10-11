class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.13.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.0/limoni-voice_v1.13.0_darwin_arm64.tar.gz"
      sha256 "a8520c3079754ac0c7e5aec043c7cbeb5b45c0162ca084444dcfc979b024b89a"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.0/limoni-voice_v1.13.0_darwin_amd64.tar.gz"
      sha256 "54dfacbd9ea86d48772849562b6524faa3de8133c9b173929c83ec892dd5c97c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.0/limoni-voice_v1.13.0_linux_arm64.tar.gz"
      sha256 "6a914e01bc6c3e43445a1cec94aa6864661124c209d33f44ef6eb1efee234cef"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.0/limoni-voice_v1.13.0_linux_amd64.tar.gz"
      sha256 "e1f1656687d23c415d651b612ad3a5471d1c0ad9ce814109e148ff389abc1f25"
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
