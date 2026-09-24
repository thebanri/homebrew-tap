cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.6.1"
  sha256 arm:   "7cd1f505f727f211d49394d34ba67bb12262d71089b4701920b76de11bd85799",
         intel: "3022c9d2eee50926e3d86e2b07765cd2b001cce4d1fba9e23aebc0887f5fe72a"

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
