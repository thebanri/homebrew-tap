cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.9.2"
  sha256 arm:   "013f4281f6a32daca95a817bdc4f455a7df3b97c981995d7a836a0b8067f7f55",
         intel: "06193614973b25e7d8ed1f3f09aa6869e8a1803ae8f003e20b1be68dd965bf8c"

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
