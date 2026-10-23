cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.0"
  sha256 arm:   "4a8677c71234041f2039b496187b0e1085c571b5bd82f32f5f1baa951e3fb2b5",
         intel: "c1b7fbe4b02c3b9fe17af51b58376f5daf8d7cbc4b2a67032c2106a388aa425f"

  url "https://github.com/thebanri/limoni-voice/releases/download/v#{version}/Limoni-Voice_v#{version}_macOS_#{arch}.app.zip"
  name "Limoni Voice"
  desc "Terminal-native, end-to-end encrypted P2P voice chat and screen sharing"
  homepage "https://github.com/thebanri/limoni-voice"

  # The app replaces itself when a new release is out.
  auto_updates true
  depends_on macos: ">= :monterey"

  # Installs the same command as the limoni-voice formula: use one or the other.
  app "Limoni Voice.app"
  binary "#{appdir}/Limoni Voice.app/Contents/MacOS/limoni-voice"

  zap trash: [
    "~/Library/Application Support/limoni-voice",
    "~/Library/Caches/limoni-voice",
    "~/Library/Logs/limoni-voice",
  ]
end
