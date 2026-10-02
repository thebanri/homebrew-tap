cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.4"
  sha256 arm:   "8df868a183eef6be0e51e0dc3d1ebb3c031e98bc23c3b052160765a38ed23d15",
         intel: "e3f2b7f8de8dc395cc5823dd36328e6d574b5d51547d6e12cf823606fcb7926b"

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
