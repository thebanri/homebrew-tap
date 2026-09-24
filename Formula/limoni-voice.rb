class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_darwin_arm64.tar.gz"
      sha256 "b6d6d42c0616a7f5e138b98134451aaac7cb198f5121b818ae874464b44cb679"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_darwin_amd64.tar.gz"
      sha256 "311878389d7d745f6db7b340d4f13823d12ce833b704024d1783ba40fda13af4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_linux_arm64.tar.gz"
      sha256 "5bccdc8cace5616d9d75250c02f3df8b81eccfcd9b64a668f36f97d94ffa5b92"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.7.0/limoni-voice_v1.7.0_linux_amd64.tar.gz"
      sha256 "7fb74bfccee078e35cdfa08bd7e5a90e323109cb3fc884a1288cf79551f30d13"
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
