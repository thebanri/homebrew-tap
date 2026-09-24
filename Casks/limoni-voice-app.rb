cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.6.0"
  sha256 arm:   "ce641d7f33bf09ca7215d07dd1193db50d452622e0625b3ae95c5ec319763b1e",
         intel: "581c241ca6564b4caf499bf971c5076b3502b1ca7d53c3aa7104f540c57549c9"

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
