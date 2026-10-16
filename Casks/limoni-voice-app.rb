cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.13.5"
  sha256 arm:   "bca54a51b62e70e1b9d45aed51ee446869d35a35c7a0c967066dee4add7f3a2e",
         intel: "e661a4da3340afb4dfa0bd5f20097a4662c2295670c0b4f309b8ab83ede9810d"

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
