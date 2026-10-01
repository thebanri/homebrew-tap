class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.12.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.0/limoni-voice_v1.12.0_darwin_arm64.tar.gz"
      sha256 "bd53e2e721d55638ccf371847c96d7cac69662d37620dffd826f97b884c0e827"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.0/limoni-voice_v1.12.0_darwin_amd64.tar.gz"
      sha256 "0150699ddfe2346f1635ba79799800d7ccad0beb775bde6167e161040b4d5004"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.0/limoni-voice_v1.12.0_linux_arm64.tar.gz"
      sha256 "2567630b29cc98243281277f3523d172eeb83922bbb2a60b1a641957784628fc"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.12.0/limoni-voice_v1.12.0_linux_amd64.tar.gz"
      sha256 "ddf1d61717b745d24b4f5292361a7f693c47aa2dee51cedddf5a9ae0f7a803ab"
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
