class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.10"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.10/limoni-voice_v1.17.10_darwin_arm64.tar.gz"
      sha256 "bf73c7f2c398849f6b658b4233244a4e1f9dc28d00e87127cc15fc92b9c1c4f4"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.10/limoni-voice_v1.17.10_darwin_amd64.tar.gz"
      sha256 "7b604210ee1f139e546e0cf20cf5f36e35d1362de112372f80593c1348d58f91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.10/limoni-voice_v1.17.10_linux_arm64.tar.gz"
      sha256 "10694a232b1acaa38430614ba388a48e61a4b66a67f7efe36a66020ae896fedd"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.10/limoni-voice_v1.17.10_linux_amd64.tar.gz"
      sha256 "851ef0cdb1ee1defca74a3e300da78b14e6ce438e47979a0a32de6c4e6e182d2"
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
