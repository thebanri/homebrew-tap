cask "limoni-voice-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.16.1"
  sha256 arm:   "f4aeef6334a496441a2f5d4577820585ad9d6e6bbf6df53352d7e1e381e62177",
         intel: "6874a62345cc27e7494dd10a2d498b9356babdb56fd9ac3d1c07c967efb84928"

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
