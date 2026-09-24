class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.0/limoni-voice_v1.6.0_darwin_arm64.tar.gz"
      sha256 "ac3229c3ef7a7f0eeba6cb6694bc2b0f786e0c35b5612bd4ffdb38b773eba44b"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.0/limoni-voice_v1.6.0_darwin_amd64.tar.gz"
      sha256 "47f903747e3ed35fbc70dcab99bacf3930556bcb14008ac6c23c3f8522dbb543"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.0/limoni-voice_v1.6.0_linux_arm64.tar.gz"
      sha256 "6b21cad8ef9ad086396a2db87b7169519a678084e7a2645362c7010568dea8ee"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.0/limoni-voice_v1.6.0_linux_amd64.tar.gz"
      sha256 "56fdc07b656d82de8e9b1645b51ff2a34b7b68245c7f62629462c6f9f45f6876"
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
