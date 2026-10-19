class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.16.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.1/limoni-voice_v1.16.1_darwin_arm64.tar.gz"
      sha256 "34be3eae1978e32dd97bff31443d553f8c25b25142afa2fe1acc2d1f306b1604"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.1/limoni-voice_v1.16.1_darwin_amd64.tar.gz"
      sha256 "63bd36832621f2db156611266fa067685db7a316318709e5280044e201c7803c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.1/limoni-voice_v1.16.1_linux_arm64.tar.gz"
      sha256 "c8d11d947a94a76826af2f3ef9bcaaceedf4c1719ea4c0d5c0e7965e4fe4efbd"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.16.1/limoni-voice_v1.16.1_linux_amd64.tar.gz"
      sha256 "fb3a2689dcd36993fed54aeef28256b3f36ee0d128be4b6c447e06251f204393"
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
