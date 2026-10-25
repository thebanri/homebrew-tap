cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.6"
  sha256 arm:   "6c6aeb85f46a9ff700158a8a8059c6adb39a65903967516c73817bf9bd056fe9",
         intel: "754eda5bd2c7bb60d665caa46cc6ab8efaced802803b11dd23ad547fba4f90e9"

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
