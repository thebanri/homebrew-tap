cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.14.0"
  sha256 arm:   "02c138b29eb3e6d1942600879fb1c84082343b5ebcfceb87a666a9ef8eed321f",
         intel: "2e69999c0850f8547ddb614b9047e6ec844f63b3d335855ae4f906dd41689f2a"

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
