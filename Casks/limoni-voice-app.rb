cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.7"
  sha256 arm:   "a2230d0bcd9c6cf513c34bd05779a4fe237395c51bbae1e04380429ce93736f9",
         intel: "19ce0e366f8dc43200f2196b01ea355ce679d2394abefdbd6a5460342128a798"

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
