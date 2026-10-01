cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.1"
  sha256 arm:   "d6ee034b07b7b58ae14fbcaecd3099201505522b0a4b71bfa7c2801cbc04324a",
         intel: "e0e1830ae5c30042abc32fcde7174f7cc49020124b068bd5447a368108d34298"

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
