class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.8"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.8/limoni-voice_v1.12.8_darwin_arm64.tar.gz"
      sha256 "f7021aa7c6428a61a3cccd491c78351df7de67dccc18e45638ac38437eac6f5d"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.8/limoni-voice_v1.12.8_darwin_amd64.tar.gz"
      sha256 "d92bf158b59c71cb6ef47eb9c34e38b891ea4ac99655bd6afe69ba29597e41a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.8/limoni-voice_v1.12.8_linux_arm64.tar.gz"
      sha256 "15146e831016f45c506d3d4f9b07e7c6bc08136259dc1a0cbc8b387c2b58b08e"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.8/limoni-voice_v1.12.8_linux_amd64.tar.gz"
      sha256 "621dcd5d925a31e7619702222fbf25e1f57e41aeaf01d0f07cf79449cbd937e6"
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
