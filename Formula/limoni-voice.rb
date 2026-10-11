class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.13.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.1/limoni-voice_v1.13.1_darwin_arm64.tar.gz"
      sha256 "2c438fc0f2c81017cf381cda1966cbb5ef22e88f1febebe04358c8bd785beab9"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.1/limoni-voice_v1.13.1_darwin_amd64.tar.gz"
      sha256 "de425f26a4a8b7617d835f5996537c78cf071b366d32b1dcd3c48108f03e72bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.1/limoni-voice_v1.13.1_linux_arm64.tar.gz"
      sha256 "e6408b6d726993a612c89ca82a0054e8ef5bc3038e28f5ab5a18f0372a878eb2"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.1/limoni-voice_v1.13.1_linux_amd64.tar.gz"
      sha256 "017b4936b6021ed99bd75e8edc07f27f39ff94d4576854ad370fa706d485b07a"
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
