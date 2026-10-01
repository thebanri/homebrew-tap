cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.11.2"
  sha256 arm:   "5a2cf291028023336c147fd2483eeee5a67fae1ef87d59bffb991438cc019b8c",
         intel: "8ec108f00c79998b0b22f822074f47f9e52188b003e87b2a99546005f21d2835"

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
