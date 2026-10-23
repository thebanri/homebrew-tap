class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.0/limoni-voice_v1.17.0_darwin_arm64.tar.gz"
      sha256 "0cef514b32f7825cad5d7c99c3fbc1c10fae25e9e7b6e390ec00ac7231a23bb1"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.0/limoni-voice_v1.17.0_darwin_amd64.tar.gz"
      sha256 "49def3e4b55937a852883c1d96971fdb03a01370e6c955869d0686ad4619ed44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.0/limoni-voice_v1.17.0_linux_arm64.tar.gz"
      sha256 "b5e2c7c2e87912635c7653c58661ddcf409a80cb49153608d5e6a864a17c6910"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.0/limoni-voice_v1.17.0_linux_amd64.tar.gz"
      sha256 "23b0a6e8f1016e1d21e7e0ccbb46421f8f2610fcdc321b68d8e554c62329e686"
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
