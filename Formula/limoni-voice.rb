class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.2/limoni-voice_v1.17.2_darwin_arm64.tar.gz"
      sha256 "b619327f5d52d89cecba5d4e79df85179133a38d415d02741574e424a2d1f05a"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.2/limoni-voice_v1.17.2_darwin_amd64.tar.gz"
      sha256 "ee9ee2b9c5c0b8319218002698d6a9e1f7330dc0bc0fc3cdd5fc9c05ef913164"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.2/limoni-voice_v1.17.2_linux_arm64.tar.gz"
      sha256 "4a8c7259c63f43bf85896db49622dd188eeec293ce934e04fabc1d1b39fbc959"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.2/limoni-voice_v1.17.2_linux_amd64.tar.gz"
      sha256 "f89e86c859f21d6afb31b641a33fea8d48211166884dfc22784ea509d90e28ff"
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
