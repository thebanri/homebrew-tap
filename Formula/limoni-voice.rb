class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.13.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.2/limoni-voice_v1.13.2_darwin_arm64.tar.gz"
      sha256 "f34e0d0c4e7fc1ed4ba8910864e12ef6ea0b4ebe3940bb04565ace99ef996521"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.2/limoni-voice_v1.13.2_darwin_amd64.tar.gz"
      sha256 "c5311039adccc178b5cf214d1d0fcade970901481cb4a7aa47b462c99c75d8a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.2/limoni-voice_v1.13.2_linux_arm64.tar.gz"
      sha256 "d8ee1fd1132f37a182dbe544534901484f2680c7b94ad7a1ee12bf5d8bf080e3"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.2/limoni-voice_v1.13.2_linux_amd64.tar.gz"
      sha256 "cb5692cc8578e53bfe10580f3ec570bacb4f3a00663d258c2ca0e1a43cc6a9c1"
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
