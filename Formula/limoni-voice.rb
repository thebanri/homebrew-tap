class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.4"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.4/limoni-voice_v1.12.4_darwin_arm64.tar.gz"
      sha256 "858d01765d5f0223f35472971df408ba2e58033e8ca214b627497d4a98e396d5"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.4/limoni-voice_v1.12.4_darwin_amd64.tar.gz"
      sha256 "2535019e1953ce8be93ddec2ed3e69f2ed9f0f39df51ce8162451b37d6091409"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.4/limoni-voice_v1.12.4_linux_arm64.tar.gz"
      sha256 "4285d02282f46a7c32702bcfd0558fefd5087953ed446e985b6be42147093d50"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.4/limoni-voice_v1.12.4_linux_amd64.tar.gz"
      sha256 "7adf71490e3cfd6e5f75507f5e53c42ad8921f5bcabcbff479d7b46bdf16b019"
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
