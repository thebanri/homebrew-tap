cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.9"
  sha256 arm:   "ba2ec185ec3cb18025c707a69093d75f3a359e9aa7e4c562dafe54d89549b39d",
         intel: "63096d13dd10d0b9b28d95f274fab30d991e8daa6da652bcbca847f31fa75e51"

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
