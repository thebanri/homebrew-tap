cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.9.1"
  sha256 arm:   "d21332a12c657d663ca1307cd800ac47f6a7171ff3b3416bdfc31aa8c60af523",
         intel: "418e482d867745f8cf7f7b1ca17f5e29a65224e6bdea7f99b295d5a4ef373555"

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
