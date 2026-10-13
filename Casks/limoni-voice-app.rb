cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.13.4"
  sha256 arm:   "7a398956958967022df385d6b80768d9212deab3c6300429b869b91c4f652ba7",
         intel: "e6a6b005b7e43bd6de546df62bdf46deff5bbdfb6cbf2bf3ded2b97663a5a4bf"

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
