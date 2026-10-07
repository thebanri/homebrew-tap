class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.6"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.6/limoni-voice_v1.12.6_darwin_arm64.tar.gz"
      sha256 "6b819621197e46848dae379316f4529a4cacb47e79f26ecc2b33509be82e784c"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.6/limoni-voice_v1.12.6_darwin_amd64.tar.gz"
      sha256 "92bcdf70d976be21aa9245a3731b8911ebe592f40053830d457bc661f7607614"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.6/limoni-voice_v1.12.6_linux_arm64.tar.gz"
      sha256 "e1c3c61a3eb2e533f5b1202eafd6bd5daa536c51f6828fec9b272e329ae4a858"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.6/limoni-voice_v1.12.6_linux_amd64.tar.gz"
      sha256 "88792f1c0691fbf4f3566a478bbd08f612c9d0dd8d4dc896a0e25cf0be61af23"
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
