cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.7"
  sha256 arm:   "73898f382d357205d352d11211c3d462e2e8fd1a73fba22c9cd1181252ad980f",
         intel: "6560b887b0bec5819ce2bd947f2a245f7682dcd4c240a0a219e42631d56d3638"

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
