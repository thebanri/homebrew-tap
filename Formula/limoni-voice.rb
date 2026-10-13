class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.13.4"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.4/limoni-voice_v1.13.4_darwin_arm64.tar.gz"
      sha256 "ddb72dbef5f39baee8f47aeeb8e7db6f1205a8a8e351f86859068be86a1f3847"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.4/limoni-voice_v1.13.4_darwin_amd64.tar.gz"
      sha256 "46daecb9e9b1eb2b11c22f6bb954e4e7e1231bc2824e749c3aa12ddae2983786"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.4/limoni-voice_v1.13.4_linux_arm64.tar.gz"
      sha256 "70396b8b377e6f0d0a70e6194a1ec026893df9bd92844875f19ec040d7fc89f1"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.13.4/limoni-voice_v1.13.4_linux_amd64.tar.gz"
      sha256 "6f74ea2a2d36d8d9584bacb539b0a384db22e9597e8b6701cd4a7bba81d06d1d"
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
