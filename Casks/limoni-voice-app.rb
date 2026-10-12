cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.13.2"
  sha256 arm:   "78ba5867870e6452b20787792769a6a3ad224ec88741753fa0c856dc07dcfe9f",
         intel: "36d110bfcc7ee8d20a1423caef56128d5385554ac4f64aa80005213b6da26028"

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
