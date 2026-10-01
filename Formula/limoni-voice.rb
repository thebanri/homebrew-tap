class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.3/limoni-voice_v1.12.3_darwin_arm64.tar.gz"
      sha256 "8568dd809dd800e33d460f61b5224557e2e6c116195d0578a62446b81a161905"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.3/limoni-voice_v1.12.3_darwin_amd64.tar.gz"
      sha256 "7e58793715fd4125419cfb77f672bed468ac925e54e3ecd13fb1e92276abb9a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.3/limoni-voice_v1.12.3_linux_arm64.tar.gz"
      sha256 "2fbdc2860ecdfe2a50b4a997521388bde4b2ed518769255e081db8b92995b8e1"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.3/limoni-voice_v1.12.3_linux_amd64.tar.gz"
      sha256 "4346425c320d87b90dc7a7d11d828945bac6a7bfc395e1ad0db253509601ae25"
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
