cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.7.0"
  sha256 arm:   "67847b703189bcab07e4b446d8e74af13ad78cc1c373f3f7748e6cadfb8efb9d",
         intel: "76067b4bedeaf9b888409d0d19c03ba7118df1e1d30c6d7d14b18e58c2dbc620"

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
