cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.5"
  sha256 arm:   "64ce91b21ab04db22bc636fba1b5c4dfe49a71113bd46b627906ba8d324bf5d6",
         intel: "9ba2acd00b26bace49b89c29739e3967051bc00f60863f17331294919cf5bb0f"

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
