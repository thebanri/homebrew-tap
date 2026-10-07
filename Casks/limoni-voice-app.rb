cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.12.6"
  sha256 arm:   "eb11b0067b2d1ae503ec58fbb6445d3b7adde477a02e278680c2741e1a431a47",
         intel: "70831bf3d3b167bdc2987ddee69e96a97cc4f8e6c19ac3defca635feecb68adf"

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
