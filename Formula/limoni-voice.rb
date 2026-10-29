class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.9"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.9/limoni-voice_v1.17.9_darwin_arm64.tar.gz"
      sha256 "4b8b61f57f65806ee7f658f85f9de0009752fb76f14c12dfd18e6a2615bbc7f0"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.9/limoni-voice_v1.17.9_darwin_amd64.tar.gz"
      sha256 "4393befef1cae60531a8918b2c3aedb70c9a7e9ce0ac4bf0d3b290972f57d256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.9/limoni-voice_v1.17.9_linux_arm64.tar.gz"
      sha256 "b8f093cfa77cda8918c1cc234a65683a08d1526a2f91eea9226dd7baf7db1ffc"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.9/limoni-voice_v1.17.9_linux_amd64.tar.gz"
      sha256 "2f4834c42669beb08b247ea9b500ee1a38ce4d418d54e004bb3ecb41a6e17aa7"
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
