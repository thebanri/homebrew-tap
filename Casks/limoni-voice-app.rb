cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.8"
  sha256 arm:   "31752f634597c7df11fe9cccb275b8005fb464d5d7da5f3150b971ba6d9d055e",
         intel: "922f39c74dd721e1ded3d2599d89ec66a597d9c812c91a41e98a2f22cf097ce5"

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
