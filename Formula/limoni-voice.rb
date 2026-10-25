class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.4"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.4/limoni-voice_v1.17.4_darwin_arm64.tar.gz"
      sha256 "1a964d5631c2ac5c45ff1647f2b41764548520e95f00a25af0aa76a3675b8dcb"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.4/limoni-voice_v1.17.4_darwin_amd64.tar.gz"
      sha256 "ba8eea0b4c311014e5213f55c44dfcf5089b79ff63b63883e5ba674bebfe271d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.4/limoni-voice_v1.17.4_linux_arm64.tar.gz"
      sha256 "3739a1bdfea8ccbe829c554d9719d34a9fbd3cedebefcc7093d584f5d8016e1c"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.4/limoni-voice_v1.17.4_linux_amd64.tar.gz"
      sha256 "dcbf1da7dfe36601b6b03346151fb07e77c9affafc099f492c964865020ccfa0"
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
