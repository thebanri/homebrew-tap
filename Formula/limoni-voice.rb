class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.13.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.3/limoni-voice_v1.13.3_darwin_arm64.tar.gz"
      sha256 "51efa206bea72eef81040baeaf3b9054ac1e614a6e3564030658102e2a7319b6"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.3/limoni-voice_v1.13.3_darwin_amd64.tar.gz"
      sha256 "2534e65f4dd1ad1ecd4584be7dc9d1164e7a130bdd1ee533c89092bc459b167c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.3/limoni-voice_v1.13.3_linux_arm64.tar.gz"
      sha256 "243cb858f9be98911f5f5445f1f9645fd90d2d8dc7dec78135dd07ebc0c1026f"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.3/limoni-voice_v1.13.3_linux_amd64.tar.gz"
      sha256 "21da5e20f3395c20c70f8bec512f2afc3a0dcf9e029cd7b90969f0ec0e9f7ca0"
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
