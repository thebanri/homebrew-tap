class LimoniVoice < Formula
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"
  version "1.17.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.3/limoni-voice_v1.17.3_darwin_arm64.tar.gz"
      sha256 "804b421cac955b382fff973b9d1b981249039e5a4a134f7654bb789455728dbe"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.3/limoni-voice_v1.17.3_darwin_amd64.tar.gz"
      sha256 "00f5666dda854b1ed969a7b9ed80344d0212afcde4ab35c22c1efd77e2c96a3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.3/limoni-voice_v1.17.3_linux_arm64.tar.gz"
      sha256 "ba428df340a9e21b32be9a333e90e58832a2c00ee6d09ef3c8edda81c8fe8b62"
    end
    on_intel do
      url "https://github.com/thebanri/limoni-voice/releases/download/v1.17.3/limoni-voice_v1.17.3_linux_amd64.tar.gz"
      sha256 "a370efebe8b9b7ca1bf23cf19dcd04a3846dbe07762dbe4635905b87a6885a48"
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
