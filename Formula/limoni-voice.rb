class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.15.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.0/limoni-voice_v1.15.0_darwin_arm64.tar.gz"
      sha256 "c838862d1486913984db1612d6da4d001fc6b8e7737cb4a5675381f0958b5663"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.0/limoni-voice_v1.15.0_darwin_amd64.tar.gz"
      sha256 "942f4b5875b1f705451894d8efb19fe29a80a865d8431b2b5675aa8c3f769607"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.0/limoni-voice_v1.15.0_linux_arm64.tar.gz"
      sha256 "7b162c6ee61721b5e4f9a3eaa0c557624c78719871cbbba30e241bd36f75ac1e"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.0/limoni-voice_v1.15.0_linux_amd64.tar.gz"
      sha256 "8227c88d13207a34a970f20d03a908078913b8d5b50ad0c1d9b036c92054ff6c"
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
