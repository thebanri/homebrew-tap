cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.11.0"
  sha256 arm:   "7d236d9fc2d7024ba2c11d0d8c79b8a6fb2a02aa375c7fe4222c71b4007c3162",
         intel: "47f415cda99c37fa060af0f44050ba02010dde1427fe7070f133c072b33ccd40"

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
