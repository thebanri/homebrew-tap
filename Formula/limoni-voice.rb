class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.9.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.1/limoni-voice_v1.9.1_darwin_arm64.tar.gz"
      sha256 "2a2f7758ee37a7b19fee5a7c75d321ebf36105fc3f4c8f400317597d2deeb143"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.1/limoni-voice_v1.9.1_darwin_amd64.tar.gz"
      sha256 "ee4b6ef17bac385df95971632c34d05f753d55f7c294381510ea954873e9e624"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.1/limoni-voice_v1.9.1_linux_arm64.tar.gz"
      sha256 "ceb58c10c68ad40cc6fd4665d7d68c97a824c152ab3e02554ff1c830adc3df3c"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.9.1/limoni-voice_v1.9.1_linux_amd64.tar.gz"
      sha256 "3deca01cca7e03922d31401eb98057173cc8559c97c8cbf369c2f01ea36a86ce"
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
