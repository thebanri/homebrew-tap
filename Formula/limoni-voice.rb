class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.9.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.0/limoni-voice_v1.9.0_darwin_arm64.tar.gz"
      sha256 "4032948af321b478bdd9a28ef4da1d08cd1fd1915d0c2d5f30cecf39e1f0dd3f"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.0/limoni-voice_v1.9.0_darwin_amd64.tar.gz"
      sha256 "61921ea3fde10678f919790065a0c9dbe924c5a06ab9b1c97a2b971403eba034"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.0/limoni-voice_v1.9.0_linux_arm64.tar.gz"
      sha256 "7e48c36cd6925d1505f2499e2ce3d964bd8acd43fb136755d007754b6202a1e2"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.0/limoni-voice_v1.9.0_linux_amd64.tar.gz"
      sha256 "3e034bebd329c0e52ce6ed1884225d4bd04f660e43a9e220423e467845a7cebc"
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
