class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.5"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.5/limoni-voice_v1.17.5_darwin_arm64.tar.gz"
      sha256 "8a1931ed657f16695e0413ea7f9a261380131d3e6fe5c63d77bc893c967944f8"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.5/limoni-voice_v1.17.5_darwin_amd64.tar.gz"
      sha256 "8f75309974b90bd9f5f855c9e685827dd6e2c7b9e7417c61124b8704213cf04f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.5/limoni-voice_v1.17.5_linux_arm64.tar.gz"
      sha256 "92696b9e75c6871d1adfdc055f9f78968976fd3f48825f541d3161d895d0acbf"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.5/limoni-voice_v1.17.5_linux_amd64.tar.gz"
      sha256 "41bf4d07592659f6a007695ce24b7fc0433de0fe9ed08a690ea9eccdb1c24a49"
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
