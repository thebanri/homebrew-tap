cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.4"
  sha256 arm:   "34ecc16404a8670fbab004e88c50433f41c28890bfccf6d3c3db50339253a2dc",
         intel: "25ca6f290d00e025359b796faed768a12660a60f1cffa1ce3abb14adfccd22c4"

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
