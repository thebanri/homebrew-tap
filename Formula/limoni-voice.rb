class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.5"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.5/limoni-voice_v1.12.5_darwin_arm64.tar.gz"
      sha256 "87dbeb462af37f33fdd5b3fe6c8485b7984b04f570ce38f3e15d8be8981e3a5c"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.5/limoni-voice_v1.12.5_darwin_amd64.tar.gz"
      sha256 "482c5161543b3ef17cdeb2fa3b4d5bc0ee4c22d7e47a74aeebd446f92fcb6619"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.5/limoni-voice_v1.12.5_linux_arm64.tar.gz"
      sha256 "efb4f1f22cd71fde220706016752d17fae68f4326605937ba0d1865fcadef7ed"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.5/limoni-voice_v1.12.5_linux_amd64.tar.gz"
      sha256 "2eb8a5617913f1591c92e92ec2e0d32c10ec5c37d6c216acd97fef72b60ae49b"
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
