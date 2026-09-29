cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.8.0"
  sha256 arm:   "1b3339f1afbc2ac3b96cfd938e521b00750437776b01ffc0d125a236585ab47e",
         intel: "2d532aa53c8f4b9a93040fab16d462defefa6c46c058a18a233e0b3537bcad77"

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
