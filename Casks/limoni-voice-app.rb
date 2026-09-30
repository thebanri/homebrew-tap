cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.9.0"
  sha256 arm:   "84e69f2b5cb3c7207a8819b8785400cd293e4ab6949a62186632200725d554a5",
         intel: "0893492abf82dca21c3b7458e60274d2b74d09d0717eb09b3c03238ebc2d4b72"

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
