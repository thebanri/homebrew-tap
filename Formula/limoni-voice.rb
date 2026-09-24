class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.1/limoni-voice_v1.6.1_darwin_arm64.tar.gz"
      sha256 "61a988de83d08512b16a4901f75375934cf058ce9db6dc34069214d929477b2f"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.1/limoni-voice_v1.6.1_darwin_amd64.tar.gz"
      sha256 "a3b4a4a20a19eb80070a5943deb5b9bf93f2e313b16837ddd38248aeecd4e71c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.1/limoni-voice_v1.6.1_linux_arm64.tar.gz"
      sha256 "9129551aa2649a979f4e7cd80c4429b3a42298dcd9f974a1710c272d9cb66cda"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.6.1/limoni-voice_v1.6.1_linux_amd64.tar.gz"
      sha256 "8d91bb2fde27c7c055d593bca448febfa2807cf49c6326431647aa177d4d4e6f"
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
