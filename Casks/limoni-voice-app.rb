cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.5.1"
  sha256 arm:   "72360313f6cb50fefb5955a04704ce47fe3ffcea0e6e1029fe56ca4403d9c3f2",
         intel: "4f77a940e12bc4be76da3ba39dc28fa7206517245df717d2cfe472268de31942"

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
