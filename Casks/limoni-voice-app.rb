cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.2"
  sha256 arm:   "5044c99f1eefa4995d17405fbb98b0df1a342c9c37e02af9203f3f20cc81523f",
         intel: "19afd948ade822bbe1aee590f9433dbf08a5f6c059c4e49d2d386372d19b480e"

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
