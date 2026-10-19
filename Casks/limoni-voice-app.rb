cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.16.0"
  sha256 arm:   "3af92a9ce506bd4b6b062c34c550cd54483b3ef7e037a3570c6bc360b05751ea",
         intel: "59c8be4a23716898eb0b3c714ceeca61a30c36dcd7f160bc1d58b444fcdb9ec8"

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
