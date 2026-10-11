cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.13.1"
  sha256 arm:   "5cf0aa246e2f04fc05c26ad5f969f8abdc2b16d9d58bae7c2d7b933930a53900",
         intel: "6c0165b1b0614b1b2b9d9df5095a4bd31f9735c52c4ef6b7363f94b95b0e698d"

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
