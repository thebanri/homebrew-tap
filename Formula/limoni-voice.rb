class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.9"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.9/limoni-voice_v1.12.9_darwin_arm64.tar.gz"
      sha256 "ff1097e2002634730795d25ebb87016a892ed29a705a78f95379d2eb99ba52d2"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.9/limoni-voice_v1.12.9_darwin_amd64.tar.gz"
      sha256 "762d40d2a43d45538dd6090b6030559ffbcd1f85307be8f912f4e88abc017fff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.9/limoni-voice_v1.12.9_linux_arm64.tar.gz"
      sha256 "6d03de747b5e260dad100677e7bc3cad4425aed276f20f9a8aa7e69ad271eabf"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.9/limoni-voice_v1.12.9_linux_amd64.tar.gz"
      sha256 "9f55197d0c3677d8fb60287df91428bda5ced40fc85d5bf9cdc25df11e7cc8da"
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
