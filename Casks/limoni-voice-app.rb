cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.15.0"
  sha256 arm:   "d7ba7390ab7be29e2211db3b38a71c74a3d30acdf1faf314305f91c4531d3e6f",
         intel: "a4e9a7bfb8b0eddbdfae1f6be46d68d9bde9ae171061ff08f5d1018f2f32a549"

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
