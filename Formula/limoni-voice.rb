class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.10.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.10.0/limoni-voice_v1.10.0_darwin_arm64.tar.gz"
      sha256 "89ac1cd030825581a85c00b9266a7721502b34a19e75665b79c373ff4c30548f"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.10.0/limoni-voice_v1.10.0_darwin_amd64.tar.gz"
      sha256 "46220f8b7388c4ce05369c202c6cb842a80308223b4c444b0c24cdcaa9beda13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.10.0/limoni-voice_v1.10.0_linux_arm64.tar.gz"
      sha256 "ec12ec35ecc0ae18e3733d2165c2782c3cf7a0449f9bc55c8d44654332b7a76c"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.10.0/limoni-voice_v1.10.0_linux_amd64.tar.gz"
      sha256 "364dc187b10ce82734a5efc838147a7f8a974822c81992ec304094d30b40fd92"
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
