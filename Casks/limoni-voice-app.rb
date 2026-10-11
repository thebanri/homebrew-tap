cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.13.0"
  sha256 arm:   "82a514629614ac9bc1a3180dbbbbe235df46853d74312be1c5d9826de17b7e9b",
         intel: "db97b0e1977f1fe503254ebdad47d5e92b7bfbb4febb6cd3298ed0ed1554c809"

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
