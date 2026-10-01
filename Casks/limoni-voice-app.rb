cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.0"
  sha256 arm:   "24ee4b9fdd3839d754b745d7c895e95794f90060c964b303b15c89e95b401e95",
         intel: "10fbaa146fe27ec7557b3fa0cb4d1c5dc4cf4519151f119e84cd0fa2556bbdf9"

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
