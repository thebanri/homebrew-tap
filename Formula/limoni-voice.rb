class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.1/limoni-voice_v1.12.1_darwin_arm64.tar.gz"
      sha256 "d9e49e1d656550cdad3231afead558f4295a86ac125af6a839fb0f750da98b68"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.1/limoni-voice_v1.12.1_darwin_amd64.tar.gz"
      sha256 "28f00a8142cb34e5b772e93dc66be8ae506d57abe14eab49eb54cfadef76143d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.1/limoni-voice_v1.12.1_linux_arm64.tar.gz"
      sha256 "a898eac5c9d89b709e2eaa912f57e659605bc464f1a2b47e9e7130854bebb6fb"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.1/limoni-voice_v1.12.1_linux_amd64.tar.gz"
      sha256 "4f4c09d99916f8599365366f56367ab3c15b40fc6c78dfb87ff1d56202f88603"
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
