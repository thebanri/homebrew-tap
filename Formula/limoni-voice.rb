class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.9.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.2/limoni-voice_v1.9.2_darwin_arm64.tar.gz"
      sha256 "ea239e003c7f87b3841b70c8ee04c80fa39403cf8732c0c645ffae68ea71d066"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.2/limoni-voice_v1.9.2_darwin_amd64.tar.gz"
      sha256 "5fb74845e169d41e9ea90ae48e17520aca24b36a0abbf611443513f311f7e1f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.2/limoni-voice_v1.9.2_linux_arm64.tar.gz"
      sha256 "4cd8e402bbf9d7ae7c82bebf54a1987b2ab58f628e966dada2b1f9432d74a375"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.2/limoni-voice_v1.9.2_linux_amd64.tar.gz"
      sha256 "600f906d5b9a73183cfb0fe5b2f5383f667d2b32c176e58edcd9d95837422c53"
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
