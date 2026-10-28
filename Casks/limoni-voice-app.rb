cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.8"
  sha256 arm:   "98e994d886b408fa3591c5e553e604f829cbe3951c835bc1c5cffb0b616597a5",
         intel: "0d692378f245a2acef9d579c81bedd6c4e330dbac93b4867328847f137359edf"

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
