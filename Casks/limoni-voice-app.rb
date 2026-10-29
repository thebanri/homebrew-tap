cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.17.10"
  sha256 arm:   "967e1f240ab92d6189e6612bb272ac3d59b3faa3a006a351d8c5a39b68c8393b",
         intel: "33c863ae6442ceace4ad3966e32feb04aa3f79b1e03d06d29f272310333b8ede"

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
