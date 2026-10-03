cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.5"
  sha256 arm:   "80b012cdb30c0e262c7cfea7dbdc465ea4cc9957c20bbc1e4b62e5a9be7ff6b7",
         intel: "515287f65d4e3a8386f0d057ce21956b70de65223b77eae94180f71a2d115582"

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
