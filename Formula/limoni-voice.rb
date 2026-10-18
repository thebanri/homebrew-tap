class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.15.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.1/limoni-voice_v1.15.1_darwin_arm64.tar.gz"
      sha256 "0eeafbe7ee7751c8326a62ae9f541f968dc4a6ca87802a8e8ef41c9610022292"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.1/limoni-voice_v1.15.1_darwin_amd64.tar.gz"
      sha256 "c17a883f137fe1fe511eada1940dbc1911c42ade4b9ec20df273db69b280f4d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.1/limoni-voice_v1.15.1_linux_arm64.tar.gz"
      sha256 "a7fb0c6d435a01221d682054de4141d282f35d142e36b624e3a99a2732a4da03"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.15.1/limoni-voice_v1.15.1_linux_amd64.tar.gz"
      sha256 "069c5f6dce7bfbea09bb570e18a7b5203c4b7bf78654a6eee4e77cd1ba768be2"
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
