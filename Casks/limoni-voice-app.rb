cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.15.1"
  sha256 arm:   "b11db2ec63e3a658679a6b5bc9e7e612b93218ac46081f2451af006fcf650943",
         intel: "8bce7c432edf67a8c4536d2c0b7ad512551876344012f814885dfa8b7d7870db"

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
