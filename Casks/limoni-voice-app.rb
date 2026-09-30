cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.10.0"
  sha256 arm:   "d8cf1adbb209b4c0383df78a33d4e1131d814ae6514fb54a4289290dd32ab3e8",
         intel: "9070985822cff370491739609822bbc27faf1baa66a3b07ec441676855cc34bb"

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
